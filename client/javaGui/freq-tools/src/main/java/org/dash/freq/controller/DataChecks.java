/*

    Copyright (c) 2014-2015 National Marrow Donor Program (NMDP)

    This library is free software; you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 3 of the License, or (at
    your option) any later version.

    This library is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; with out even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
    License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this library;  if not, write to the Free Software Foundation,
    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

    > http://www.gnu.org/licenses/lgpl.html

 */
package org.dash.freq.controller;

import io.swagger.client.ApiException;
import io.swagger.client.model.HaplotypeFrequencyData;
import java.awt.Color;
import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

public class DataChecks {

	public BigDecimal freqTotal;
	
	// Observable
	UploadTextObservable upTextMgr = UploadTextObservable.getInstance();

	public DataChecks() {

	}
	
	// checking the data for consistancy
	// does every entry have the same haploty loci?
	// does the total frequency fall within acceptable range?
	public boolean populationDataCheck(BufferedReader reader, 
										List<Integer> errorCodeList,
										List<Integer> warningCodeList
										) throws IOException, ApiException 
	{
		// while loop variables
		String row;
		String[] columns;
		boolean flag = true;
		
		// counter starts on line 3 (header is 1, line to compare to is 2)
		// allows line numbers for errors to be tracked
		int i = 3;
		
		// collect haplotype line errors, 
		// we will list the first 3 errors outside of verbose reporting
		// this is to prevent showing 3000 errors if the first haplotype has an
		// error
		ArrayList<String> haplotypeLineErrorsMismatch = new ArrayList();

		// skip header line
		row = reader.readLine();
		System.out.println(row);
		
		// read second line
		row = reader.readLine();
		System.out.println(row);

		columns = row.split(",");

		// first line for haplotype template
		HaplotypeProcessor haplotypeProcessor = new HaplotypeProcessor(columns[0]);		
		System.out.println(columns[0]);
		
		// check for missing tildas in first haplotype
		if (!haplotypeProcessor.asteriksAndTildas(columns[0]))
		{
			flag = false;
			
			// because there can be multiple errors for each line, neither the 
			// line number nor the error code can be used as the key for a 
			// hashmap. The first number is the line in question, the second 
			// number the haplotype error code, and the colon is used as a 
			// separator when parsed.
			haplotypeLineErrorsMismatch.add("2:2");
		}
		
		// first line for frequency total
		freqTotal = new BigDecimal(columns[1]);
		
		// resolution of the total frequencies & target frequency
		BigDecimal targetFrequency = new BigDecimal(1.0);
		BigDecimal maxFrequency = new BigDecimal(1.01);
		
		// read through the file, consolodate the data for checking
		while ((row = reader.readLine()) != null) 
		{
			// break the row down into useable pieces
			columns = row.split(",");
			String haplotype = columns[0];			
			BigDecimal frequency = new BigDecimal(columns[1]);
			
			// compare current line's loci to first haplotype
			if (!haplotypeProcessor.checkLoci(haplotype))
			{
				flag = false;
				haplotypeLineErrorsMismatch.add(i + ":" + 1);
			}

			// checking for missing tildas: A*01:01gA*01:01g
			if (!haplotypeProcessor.asteriksAndTildas(haplotype))
			{
				flag = false;
				haplotypeLineErrorsMismatch.add(i + ":" + 2);
			}
			
			// add the current line's frequency to the total frequency
			freqTotal = frequency.add(freqTotal);

			i++;
		}
		
		// did the flag get triggered during while loop?
		// if so, there's a discrepency between haplotype loci
		if (!flag) errorCodeList.add(9);
		
		// does the frequency fall withing the target range?
		// if frequencies total to 0 report total
		if (freqTotal.compareTo(targetFrequency) == 0)
		{
			upTextMgr.setLine(("Frequency total: " + freqTotal), "black", "both");
		}
		
		// if frequency over 1.0, but under 1.01, give warning
		// if frequencies less than 0, give warning
		else if (freqTotal.compareTo(targetFrequency) < 0 || freqTotal.compareTo(maxFrequency) < 0)
		{
//			flag = false;
			warningCodeList.add(2);
		}
		// if frequencies greater than 1.01, give error
		else
		{
			flag = false;
			errorCodeList.add(2);
		}
		
		// if there are warnings, print out the warnings to the gui
		if (!warningCodeList.isEmpty()) 
		{
			upTextMgr.setLine("", "black", "both");
			upTextMgr.setLine("Warnings:", "black", "both");

			for (int x:warningCodeList)
			{
				System.out.println("* " + ErrorCodes.warningList().get(x));
				upTextMgr.setLine(("* " + ErrorCodes.warningList().get(x)), "black", "both");

				if (x == 2)
				{
					upTextMgr.setLine(("  - Frequency total: " + freqTotal), "black", "both");
					upTextMgr.setLine("  - Frequency sum will be normalized by the server to 1.0.", "black", "both");
				}
			}
		}
		
		// if there are errors, print out the errors to the gui
		if (!errorCodeList.isEmpty()) 
		{
			upTextMgr.setLine("", "black", "both");
			upTextMgr.setLine("Errors:", "red", "both");
				
			for (int x:errorCodeList)
			{
				System.out.println("* " + ErrorCodes.errorList().get(x));
				upTextMgr.setLine(("* " + ErrorCodes.errorList().get(x)), "red", "both");
				
				// frequency total error
				if (x == 2)
				{
					upTextMgr.setLine(("  - Frequency totals: " + freqTotal), "red", "both");
				}
				
				// haplotype consistency error
				if (x == 9)
				{
					haplotypeProcessor.printOutErrors(haplotypeLineErrorsMismatch);
				}
			}
			upTextMgr.setLine("", "red", "both");
			upTextMgr.setLine("Data submission unsuccessful", "red", "both");
			upTextMgr.setLine("Please fix the errors and try again", "red", "both");
		}

		return flag;
	}
}

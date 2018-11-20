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
package org.dash.freq;

import io.swagger.client.ApiException;
import io.swagger.client.model.HaplotypeFrequencyData;
import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class DataChecks {

	public DataChecks() {

	}

	public static boolean raceCheck(String raceFirst, String race, List<Integer> errorCodes) {
		boolean flag = true;
		System.out.println("-----------");
		System.out.println(raceFirst);
		System.out.println(race);
		System.out.println(errorCodes);
		System.out.println("-----------");

		if (race != raceFirst) {
			flag = false;
			errorCodes.add(3);
			return flag;
		}
		return flag;
	}

	public static boolean populationDataCheck(BufferedReader reader) throws IOException, ApiException {
		// while loop variables
		String row;
		String[] columns;

		// read first line
		row = reader.readLine();
		columns = row.split(",");

		// set variables for assorted checks
		System.out.println("Setting initial variables");

		boolean flag = true;
		List<Integer> errorCodes = new ArrayList<>();
		System.out.println("Error codes array: " + errorCodes);

		// frequency totals up to 1.0000
		BigDecimal freqTotal = new BigDecimal(columns[2]);
		System.out.println(freqTotal);
//		@Range(min = new BigDecimal(0.0), max = new BigDecimal(10.0))

		// confirm populations are all the same
		String raceFirst = columns[0];
		System.out.println(raceFirst);

		// read through the file, consolodate the data for checking
		while ((row = reader.readLine()) != null) //&& flag == true) 
		{
			System.out.println(row);
			columns = row.split(",");
			String race = columns[0];
			String haplotype = columns[1];
			BigDecimal frequency = new BigDecimal(columns[2]);
			System.out.println(race);

//			flag = raceCheck(raceFirst, race, errorCodes);
//			if (!raceFirst.equals(race))
//			{
//				flag = false;
//				errorCodes.add(3);
//			}

			// add the current line's frequency to the total frequency
			freqTotal = frequency.add(freqTotal);
			System.out.println("While-loop frequency total: " + freqTotal);
		}
		try 
		{
			System.out.println(freqTotal.setScale(4, BigDecimal.ROUND_CEILING));
			if (freqTotal.setScale(4, BigDecimal.ROUND_CEILING).equals(1.0000)) 
				throw new Error();
			
			if (flag == false) 
			{
				System.out.println(errorCodes);
				throw new Error();
			}

		} catch (Exception ex) 
		{
			System.out.println(ex);
		}

		return flag;
	}
}

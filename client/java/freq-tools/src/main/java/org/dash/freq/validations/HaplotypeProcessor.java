// /*
//  * To change this license header, choose License Headers in Project Properties.
//  * To change this template file, choose Tools | Templates
//  * and open the template in the editor.
//  */
package org.dash.freq.validations;

import java.awt.Color;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.dash.freq.gui.Gui;
import org.dash.freq.publisher.UploadFilesObservable;
import org.dash.freq.utilities.AppendText;
import org.dash.freq.utilities.Prefs;


// /**
//  *
//  * @author kaeaton
//  */
public class HaplotypeProcessor {
	
	private List<String> haplotypeTemplate = new ArrayList();
	private List<String> currentHaplotype = new ArrayList();

	private UploadFilesObservable uploadFilesObservable = UploadFilesObservable.getInstance();
	
	// how many errors to list for non-verbose reporting
	private final int MAX_ERRORS_RETURNED = 3;

	public HaplotypeProcessor (String firstHaplotypeLine) {
		// break haplotypes down to individual loci
		String[] firstHaplotypes = firstHaplotypeLine.split("~");
		System.out.println(firstHaplotypes);

		// add individual loci to haplotype template
		for (String locus:firstHaplotypes) {
			String[] locusName = locus.split("\\*");
			System.out.println(locus);
			haplotypeTemplate.add(locusName[0]);
		}
		
		// sort loci alphabetically
		Collections.sort(haplotypeTemplate);
	}
	
	// make sure all same loci are present in each haplotype
	public boolean checkLoci (String currentLoci) {

		boolean sameLociFlag = false;
		currentHaplotype.clear();
		
		// break haplotypes down to individual loci
		String[] brokenDownHaplotype = currentLoci.split("~");

		// add individual loci to haplotype template
		for (String locus:brokenDownHaplotype) {
			String[] locusName = locus.split("\\*");
			currentHaplotype.add(locusName[0]);
		}
		
		// sort loci alphabetically
		Collections.sort(currentHaplotype);
		
		// compare to haplotypes from first line of data
		if (currentHaplotype.equals(haplotypeTemplate)) {
			sameLociFlag = true;
		}

		return sameLociFlag;
	}
	
	// checking for things like this: A*01:01gA*01:01g
	public boolean asteriksAndTildas (String currentLoci) {

		boolean astTilFlag = false;
		
		int asteriks = StringUtils.countMatches(currentLoci, '*');
		// System.out.println(asteriks);
		int tildas = StringUtils.countMatches(currentLoci, '~');
		// System.out.println(tildas);

		
		// there should be one more asterisk than tilda
		if (asteriks == (tildas + 1)) {
			astTilFlag = true;
		}
		
		return astTilFlag;
	}
	
	public void printOutErrors (ArrayList<String> errorLineNumbers) {

		// if there are "MAX_ERRORS_RETURNED" or fewer errors OR if verbose is on
		// list them all
		if(errorLineNumbers.size() <= MAX_ERRORS_RETURNED || 
			Prefs.getVerboseReportingSetting()) {

			for (String lineError:errorLineNumbers) {
				haplotypeErrorParser(lineError);
			}
		}
		
		// otherwise list some and message that there are more
		else if (Prefs.getVerboseReportingSetting())
		{
			int totalCounter = MAX_ERRORS_RETURNED;
			int listCursor = 0;
		
			while (totalCounter > 0)
			{
				haplotypeErrorParser(errorLineNumbers.get(listCursor));
				
				totalCounter--;
				listCursor++;
			}
			
			// plus anything over "errorCounter"
			int remainingErrors = errorLineNumbers.size() - MAX_ERRORS_RETURNED;
			uploadFilesObservable.setLine(("  - Plus " + remainingErrors + " more"), "red", "both");
		}
	}
	
	public void haplotypeErrorParser(String errorLine) {
		
		// split the error line and print it out
		String[] parsedError = errorLine.split(":");
		uploadFilesObservable.setLine(("  - Line " + parsedError[0] + ErrorCodes.haplotypeErrorList().get(Integer.parseInt(parsedError[1])) + parsedError[0]), "red", "both");
	}
}


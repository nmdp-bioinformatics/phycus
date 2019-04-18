/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.awt.Color;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author kaeaton
 */
public class HaplotypeProcessor {
	
	private List<String> haplotypeTemplate = new ArrayList();
	private List<String> currentHaplotype = new ArrayList();
	
	public HaplotypeProcessor (String firstHaplotypeLine)
	{
		// break haplotypes down to individual loci
		String[] firstHaplotypes = firstHaplotypeLine.split("~");
		System.out.println(firstHaplotypes);

		// add individual loci to haplotype template
		for (String locus:firstHaplotypes)
		{
			String[] locusName = locus.split("\\*");
			System.out.println(locus);
			haplotypeTemplate.add(locusName[0]);
		}
		
		// sort loci alphabetically
		Collections.sort(haplotypeTemplate);
		System.out.println(haplotypeTemplate);
	}
	
	// make sure all same loci are present in each haplotype
	public boolean checkLoci (String currentLoci)
	{
		boolean sameLociFlag = false;
		currentHaplotype.clear();
		
		// break haplotypes down to individual loci
		String[] brokenDownHaplotype = currentLoci.split("~");

		// add individual loci to haplotype template
		for (String locus:brokenDownHaplotype){
			String[] locusName = locus.split("\\*");
			System.out.println(locus);
			currentHaplotype.add(locusName[0]);
		}
		
		// sort loci alphabetically
		Collections.sort(currentHaplotype);
		System.out.println(currentHaplotype);
		
		if (currentHaplotype.equals(haplotypeTemplate))
		{
			sameLociFlag = true;
		}

		return sameLociFlag;
	}
	
	// checking for things like this: A*01:01gA*01:01g
	public boolean asteriksAndTildas (String currentLoci)
	{
		boolean astTilFlag = false;
		
		return astTilFlag;
	}
	
	public void printOutErrors (List<Integer> errorLineNumbers)
	{
		// if there are one or two errors list them
		if(errorLineNumbers.size() <= 2)
		{
			for (int lineError:errorLineNumbers)
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Line " + lineError + ": the loci in line 2 are different than the loci in line " + lineError), Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

			}
		}
		
		// otherwise list some and message that there are more
		else
		{
			int errorCounter = 2;
			int listCursor = 0;
		
			while (errorCounter > 0)
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Line " + errorLineNumbers.get(listCursor) + ": the loci in line 2 are different than the loci in line " + errorLineNumbers.get(listCursor)), Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				errorCounter--;
				listCursor++;
			}
			
			// plus anything over 5
			int remainingErrors = errorLineNumbers.size() - 2;
			AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Plus " + remainingErrors + " more"), Color.RED);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
		}
	}
}


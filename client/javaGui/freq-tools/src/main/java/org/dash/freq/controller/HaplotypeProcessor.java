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
	
	public void printOutErrors (List<Integer> errorLineNumbers)
	{
		// if there are ten or fewer errors list them
		if(errorLineNumbers.size() <= 5)
		{
			for (int lineError:errorLineNumbers)
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Line " + lineError + " contains different loci than line 2"), Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

			}
		}
		
		// list some and message that there are more
		else
		{
			int errorCounter = 5;
			int listCursor = 0;
		
			while (errorCounter > 0)
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Line " + errorLineNumbers.get(listCursor) + " contains different loci than line 2"), Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				errorCounter--;
				listCursor++;
			}
			
			// plus anything over 5
			int remainingErrors = errorLineNumbers.size() - 5;
			AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Plus " + remainingErrors + " more"), Color.RED);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
		}
	}
}


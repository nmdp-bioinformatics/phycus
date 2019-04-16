/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
		for (String locus:firstHaplotypes){
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
	
}

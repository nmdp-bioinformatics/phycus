/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import org.dash.freq.model.Population;

import io.swagger.client.ApiException;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author kaeaton
 */
public class HeaderProcessor {

	// license types
	private final String[] licenseTypes = {"CC0", "BY", "BY_SA", "BY_ND", "BY_NC", "BY_NC_SA", "BY_NC_ND"};
	private final Set<String> licenses;
	
	// resolution types
	private final String[] resolutionTypes = {"G", "P", "gNMDP", "gDKMS", "1-Field", "2-Field", "3-Field", "4-Field", "Serology"};
	private final Set<String> resolutions;
	
	// populations
	private final Set<String> populations;

	public HeaderProcessor()
	{
		this.licenses = new HashSet(Arrays.asList(licenseTypes));
		this.resolutions = new HashSet(Arrays.asList(resolutionTypes));
		
		Population population = new Population();
		this.populations = new HashSet(population.getPopulationNames());
	}
	
	public TreeMap<String, String> readHeader(BufferedReader reader,
												List<Integer> errorCodeList)
			throws IOException, ApiException 
	{
		// header variables
		String header;
		String[] attributes;
		TreeMap<String, String> headerContent = new TreeMap<>();
		
		// flags
		Set<String> flags = new HashSet<>();
		boolean flag = true;
		
		// read first line
		header = reader.readLine();
		attributes = header.split(",");
		
		// break down header
		for(int i = 0; i < attributes.length; i++)
		{
			String[] parsedAtt = parseAttribute(attributes[i]);
			headerContent.put(parsedAtt[0], parsedAtt[1]);
		}
		
		// check population
		if (headerContent.containsKey("pop")) 
		{
			flags.add(checkPop(headerContent.get("pop").toString(), errorCodeList));
		}
		else errorCodeList.add(4);
			
		// check cohort
		if (headerContent.containsKey("cohort")) 
		{
			flags.add(checkCohort(headerContent.get("cohort"), errorCodeList));
		}
		else errorCodeList.add(5);
		
		// check header for license type if present
		if (headerContent.containsKey("license")) 
			System.out.println("license: " + headerContent.get("license"));
			flags.add(checkLicenseType(headerContent.get("license").toString(), errorCodeList));
		
		// check header for resolution type if present
		if (headerContent.containsKey("resolution")) 
			System.out.println("resolution: " + headerContent.get("resolution"));
			flags.add(checkResolutionType(headerContent.get("resolution").toString(), errorCodeList));
		
		// return pass/fail data in headerContent
		if (flags.contains("false")) flag = false;
		headerContent.put("flag", String.valueOf(flag));		
		return headerContent;
	}
	
	public String[] parseAttribute(String att)
	{
		// pattern to match and string to check
		String[] parsedAttribute = new String[2];
		Pattern p = Pattern.compile("^([a-zA-Z]+)=(.+)$");
		Matcher m = p.matcher(att);
		
		// if match is found
		if (m.find())
		{
			parsedAttribute[0] = m.group(1);
			parsedAttribute[1] = m.group(2);
		}
		
		return parsedAttribute;
	}
	
	public String checkPop(String popValue, List<Integer> errorCodeList)
	{
		boolean flag = false;
		
		if (populations.contains(popValue)) flag = true;
		else errorCodeList.add(3);
		
		return String.valueOf(flag);
	}
	
	public String checkCohort(String cohortValue, List<Integer> errorCodeList)
	{
		boolean flag = true;
		
		// make sure the cohort data will fit in the database
		if (cohortValue.length() >= 255) 
		{
			errorCodeList.add(6); 
			flag = false;
		}
		
		return String.valueOf(flag);
	}
	
	public String checkLicenseType(String selectedLicense, List<Integer> errorCodeList)
	{
		boolean flag = false;
		
		if (licenses.contains(selectedLicense)) flag = true;
		else errorCodeList.add(7);
		
		return String.valueOf(flag);
	}
	
	public String checkResolutionType(String selectedResolution, List<Integer> errorCodeList)
	{
		boolean flag = false;
		
		if (resolutions.contains(selectedResolution)) flag = true;
		else errorCodeList.add(8);
		
		return String.valueOf(flag);
	}
}

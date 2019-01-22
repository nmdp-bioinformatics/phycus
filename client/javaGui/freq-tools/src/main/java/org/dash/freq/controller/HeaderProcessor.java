/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import io.swagger.client.ApiException;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author kaeaton
 */
public class HeaderProcessor {
	public HeaderProcessor()
	{
	
	}
	
	public void readHeader(BufferedReader reader)
			throws IOException, ApiException 
	{
		// header variables
		String header;
		String[] attributes;
		TreeMap<String, String> headerContent = new TreeMap<String, String>();
		
		// list to collect error codes
		List<Integer> errorCodeList = new ArrayList<>();
		
		// flags
		boolean flag = true;
		boolean popFlag = false;
		boolean cohortFlag = false;
		
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
			popFlag = true;
			flag = checkPop(headerContent.get("pop"), errorCodeList);
		}
				
		// check cohort
		if (headerContent.containsKey("cohort")) 
		{
			cohortFlag = true;
			flag = checkCohort(headerContent.get("cohort"), errorCodeList);
		}

		// add error codes for missing mandatory attributes
		if (!popFlag) errorCodeList.add(4); flag = false;
		if (!cohortFlag) errorCodeList.add(5); flag = false;
		
	}
	
	public String[] parseAttribute(String att)
	{
		String[] parsedAttribute = new String[2];
		Pattern p = Pattern.compile("^([a-zA-Z]+)=(.+)$");
		Matcher m = p.matcher(att);
		
		if (m.find())
		{
			parsedAttribute[0] = m.group(1);
			parsedAttribute[1] = m.group(2);
		}
		
		System.out.println(parsedAttribute[0]);
		System.out.println(parsedAttribute[1]);
		
		return parsedAttribute;
	}
	
	public boolean checkPop(String value, List<Integer> errorCodeList)
	{
		boolean flag = true;
		
		return flag;
	}
	
	public boolean checkCohort(String value, List<Integer> errorCodeList)
	{
		boolean flag = true;

		if (value.length() > 255) errorCodeList.add(6); flag = false;
		
		return flag;
	}
}

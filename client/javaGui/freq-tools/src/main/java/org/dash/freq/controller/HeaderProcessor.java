/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import io.swagger.client.ApiException;

import java.io.BufferedReader;
import java.io.IOException;
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
		String header;
		String[] attributes;
		char equals = '=';
		boolean popFlag = false;
		boolean cohortFlag = false;
		
		// read first line
		header = reader.readLine();
		attributes = header.split(",");
		
		for(int i = 0; i < attributes.length; i++)
		{
			parseAttribute(attributes[i]);
		}
		
		
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
}

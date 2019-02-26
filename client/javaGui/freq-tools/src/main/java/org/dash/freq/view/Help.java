/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.nio.file.*;
/**
 *
 * @author kaeaton
 */
public class Help {
//	private final String fileName = "help.txt";
	
	public Help(){
		
	}
	
	public static String getHelpText() throws Exception
	{
		String helpText = "";

		try
		{
			// find help.txt from resources in jar
			URL fileLocation = ClassLoader.getSystemClassLoader().getResource("help.txt");
			Path filePath= Paths.get(fileLocation.toURI());
			
			// convert that file into a string
			helpText = new String(Files.readAllBytes(filePath));
		
		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
		}
		
		return helpText;
	}
}

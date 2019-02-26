
package org.dash.freq.view;

import java.net.URL;
import java.nio.file.*;
/**
 *
 * @author kaeaton
 */
public class Help {
	
	public Help(){
		
	}
	
	public static String getHelpText() throws Exception
	{
		String helpText = "";

		try
		{
			// find help.txt from resources in the jar
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

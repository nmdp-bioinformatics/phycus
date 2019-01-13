/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.awt.Color;
import java.io.File;
import java.util.Map;
import java.util.TreeMap;

import org.dash.freq.model.PostPopulationFrequencies;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author katrinaeaton
 */
public class BatchUploader {
	
	private static String gtRegistry;
	private static String estEntity;
	
	public BatchUploader ()
	{
		
	}
	
	public static void uploadFiles(String folder)
	{
		File dir = new File(folder);
		TreeMap<String, Boolean> processedFiles = new TreeMap<String, Boolean>();
		Boolean flag = false;
		
		try 
		{
			// instatiate Post Pop Freq
			PostPopulationFrequencies ppf = new PostPopulationFrequencies(
					gtRegistry, estEntity, null);
			
			// for each file in the folder
			for (File file : dir.listFiles()) {
				
				String fileName = file.getName();
				if (fileName.toLowerCase().endsWith(".csv"))
				{
					// print file name
					AppendText.appendToPane(PhycusGui.outputTextPane, file.getName() + ":", Color.BLUE);
					AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

					// set file and process
					ppf.setFile(file);
					Boolean processed = ppf.call() != 0;
					processedFiles.put(file.getName(), processed);
				}
			}
			
			AppendText.appendToPane(PhycusGui.outputTextPane, "Files uploaded: ", Color.BLACK);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

			for(Map.Entry<String,Boolean> entry : processedFiles.entrySet()) {
				if (entry.getValue()) 
				{
					AppendText.appendToPane(PhycusGui.outputTextPane, entry.getKey(), Color.BLUE);
					AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				}
				String key = entry.getKey();
				Boolean value = entry.getValue();

				System.out.println(key + " => " + value);
			}
		} catch (Exception e) 
		{
            e.printStackTrace();
        }
	}
}

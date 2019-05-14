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
import java.util.prefs.Preferences;

import org.dash.freq.model.PostPopulationFrequencies;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author katrinaeaton
 */
public class BatchUploader {
	
	public Preferences prefs = Preferences.userNodeForPackage(PhycusGui.class);
	private String gtRegistry;
	private String estEntity = prefs.get("PHY_EST_ENTITY", null);
	private PostPopulationFrequencies ppf;
	
	public BatchUploader ()
	{
	
	}
	
	public void uploadFiles(String folder)
	{
		File dir = new File(folder);
		
		// track unprocessed files
		TreeMap<String, Boolean> processedFiles = new TreeMap<String, Boolean>();
		Boolean flag = false;
		
		try 
		{
			// instatiate Post Pop Freq
			PostPopulationFrequencies ppf = new PostPopulationFrequencies(
					gtRegistry, estEntity);
			
			// for each file in the folder
			for (File file : dir.listFiles()) {
				
				// if file is a csv file
				String fileName = file.getName();
				if (fileName.toLowerCase().endsWith(".csv"))
				{
					// print file name
					AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
					AppendText.appendToPane(PhycusGui.outputTextPane, file.getName() + ":", Color.BLUE);
					AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

					// receipt name
					UploadReceipt receipt = new UploadReceipt();
					System.out.println(receipt.fileName(fileName));
					
					// set file and process
					ppf.setFile(file);
					Boolean processed = ppf.call() != 0;
					processedFiles.put(file.getName(), processed);
				}
			}
			
			// print out header for list of files that did not upload
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.outputTextPane, "Files not uploaded: ", Color.BLACK);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

			// cycle through list of file, print files that didn't upload
			for(Map.Entry<String,Boolean> entry : processedFiles.entrySet()) {
				if (!entry.getValue()) 
				{
					AppendText.appendToPane(PhycusGui.outputTextPane, entry.getKey(), Color.RED);
					AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				}
			}
		} catch (Exception e) 
		{
            e.printStackTrace();
        }
	}
}

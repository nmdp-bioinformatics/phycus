/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.io.File;
import java.nio.file.*;
import org.dash.freq.model.ErrorCodes;
import org.dash.freq.model.PostPopulationFrequencies;
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
		
		try 
		{
			PostPopulationFrequencies ppf = new PostPopulationFrequencies(
							gtRegistry, estEntity, null);
			for (File file : dir.listFiles()) {
				PhycusGui.outputTextArea.append(file.toString() + ": ");
				PhycusGui.outputTextArea.append(System.lineSeparator());
				ppf.setFile(file);
				ppf.call();
			}
		} catch (Exception e) 
		{
            e.printStackTrace();
        }
	}
}

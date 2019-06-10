/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.prefs.Preferences;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author katrinaeaton
 */
public class ReceiptObserver extends Observer{
	
	private String textFileName;
	private String filePath;
	private File destinationFile;
	
	// access to prefs
	public Preferences prefs = Preferences.userNodeForPackage(PhycusGui.class);
	
	public ReceiptObserver(Subject sub, File file)
	{
		
	
		// name the text file
		this.textFileName = fileName(file);
		System.out.println("textFileName: " + textFileName);
		
		// where are we putting the receipt? Default folder or custom?
		Boolean defaultFilePath = prefs.getBoolean("PHY_RECEIPT_DEFAULT", true);
		
		// create the full file path
//		if(defaultFilePath){
//			this.filePath = file.getParent() 
//				+ System.getProperty("file.separator")
//				+ textFileName;
//		} else {
//			this.filePath = prefs.get("PHY_RECEIPT_CUSTOM_FOLDER", PhycusGui.userDocumentsPath) 
//				+ System.getProperty("file.separator")
//				+ textFileName;
//		}
		
//		System.out.println("File path: " + filePath);
		
		// create destination file
		destinationFile = new File(textFileName);
		
		// if file doesnt exists, then create it
		if (!destinationFile.exists()) {
			try { destinationFile.createNewFile(); }
			catch(Exception ex){ ex.printStackTrace(); }
		}
		System.out.println("created file");

		// get date stamp & write it to the file
        LocalDate dateStamp = LocalDate.now();
		
		try(FileWriter fw = new FileWriter(destinationFile, true);
				BufferedWriter bw = new BufferedWriter(fw);
				PrintWriter pw = new PrintWriter(bw)){
			pw.println(dateStamp);
		} catch( IOException ex ) {
			System.out.println("Filewriter exception: " + ex);
		}
		
		System.out.println("Trying to create object and attach listener");
		// attach listener
		try {
		this.subject = sub;
		subject.attach(this);
		} catch (Exception ex) { ex.printStackTrace(); }
		
	}
	
	public String fileName(File incFileName) 
    {
		// create receipt file name from source file name
        String receiptFileName = incFileName.toString()
			.substring(0, (incFileName.toString().length()-3)) + "txt";

        System.out.println(receiptFileName);
        
        return receiptFileName;
    }

	@Override
	public void update() {
		
		
		try(FileWriter fw = new FileWriter(destinationFile, true);
				BufferedWriter bw = new BufferedWriter(fw);
				PrintWriter pw = new PrintWriter(bw)){
			pw.println(subject.getLine());
		} catch( IOException ex ) {
			System.out.println(ex);
		}
	}
}

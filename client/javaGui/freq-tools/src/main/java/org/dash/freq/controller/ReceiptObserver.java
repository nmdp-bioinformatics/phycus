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
import java.util.ArrayList;
import java.util.List;
import java.util.prefs.Preferences;
import java.util.Observable;
import java.util.Observer;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author katrinaeaton
 */

public class ReceiptObserver implements Observer{
	
	private String textFileName;
	private String filePath;
	private File destinationFile;
	
	// date/time stamps for file name
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH-mm-ss");
	LocalDate dateStamp = LocalDate.now();
	String timeStamp = LocalTime.now().format(dtf);
	
	// time stamp for receipt header. 
	// The one above looks like a second date stamp in the header
	DateTimeFormatter headerDtf = DateTimeFormatter.ofPattern("HH:mm:ss");
	String headerTimeStamp = LocalTime.now().format(headerDtf);
	
	// access to prefs
	public Preferences prefs = Preferences.userNodeForPackage(PhycusGui.class);
	
	public ReceiptObserver(UploadTextObservable sub, File file)
	{
		// name the text file without path
		this.textFileName = file.getName();
		textFileName = fileName(textFileName);
		System.out.println("textFileName: " + textFileName);
		
		// where are we putting the receipt? Default folder or custom?
		Boolean defaultFilePath = prefs.getBoolean("PHY_RECEIPT_DEFAULT", true);
		
		// create the full file path
		if(defaultFilePath){
			// use the path to the original file
			this.filePath = file.getParent() 
				+ System.getProperty("file.separator")
				+ textFileName;
			System.out.println(filePath);
		} else {
			// use destination specified in preferences
			// if no destination is specified, default to the user's documents folder
			this.filePath = prefs.get("PHY_RECEIPT_CUSTOM_FOLDER", PhycusGui.userDocumentsPath) 
				+ System.getProperty("file.separator")
				+ textFileName;
			System.out.println(filePath);
		}
		
		// create destination file
		destinationFile = new File(filePath);

		// get date stamp & write it to the file
		// this should automatically close the buffer at the end
		try(FileWriter fw = new FileWriter(destinationFile, false);
				BufferedWriter bw = new BufferedWriter(fw);
				PrintWriter pw = new PrintWriter(bw)){
			pw.println(dateStamp + " " + headerTimeStamp);
		} catch( IOException ex ) {
			System.out.println("Filewriter exception: " + ex);
		}		
	}
	
	public String fileName(String incFileName) 
    {
		// create receipt file name from source file name
        String receiptFileName = incFileName
			.substring(0, (incFileName.toString().length()-7)) 
			+ "_" + dateStamp + "_" + timeStamp + ".txt";

        System.out.println(receiptFileName);
        
        return receiptFileName;
    }

	@Override
	public void update(Observable sub, Object arg) {
		
		List text = new ArrayList();
		text = (List) arg;
		String who = text.get(2).toString();
		
		if(who.equals("receipt") || who.equals("both")) {
			// this should automatically close the buffer at the end
			try(FileWriter fw = new FileWriter(destinationFile, true);
					BufferedWriter bw = new BufferedWriter(fw);
					PrintWriter pw = new PrintWriter(bw)){
				pw.println(text.get(0).toString());
			} catch( IOException ex ) {
				System.out.println(ex);
			}
		}
	}
}

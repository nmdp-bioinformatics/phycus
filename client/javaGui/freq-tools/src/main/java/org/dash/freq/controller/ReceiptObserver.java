/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.io.File;
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
	
	public ReceiptObserver(Subject subject)
	{
		this.subject = subject;
		this.subject.attach(this);
		this.textFileName = fileName(subject.getFile());
		
		// where are we putting the receipt? Default folder or custom?
		Boolean defaultFilePath = prefs.getBoolean("PHY_RECEIPT_DEFAULT", true);
		if(defaultFilePath){
			this.filePath = subject.getFile().getParent();
		} else {
			this.filePath = prefs.get("PHY_RECEIPT_CUSTOM_FOLDER", PhycusGui.userDocumentsPath);
		}
		
	}
	
	public String fileName(File incFileName) 
    {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH-mm-ss");

        LocalDate dateStamp = LocalDate.now();
        String timeStamp = LocalTime.now().format(dtf);
		
		// create receipt file name from source file name
        String receiptFileName = incFileName.toString()
			.substring(0, (incFileName.toString().length()-3)) + "txt";

        System.out.println(receiptFileName);
        
        return receiptFileName;
    }
	
	@Override
	public void update() {
		
	}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Observable;

/**
 *
 * @author katrinaeaton
 */
public class UploadTextManager extends Observable{
	
	// make it a Singleton
	private static UploadTextManager instance = new UploadTextManager();

	// trying to keep this vaguely thread safe
	private List text = Collections.synchronizedList(new ArrayList(2));
	
	// prevent the class from being instantiated
	private UploadTextManager(){}
	
	//Get the only object available
	public static UploadTextManager getInstance(){
		return instance;
	}
	
	public void setLine(String line, String color) {
		text.add(0, line);
		text.add(1, color);
		
		setChanged();
		notifyObservers(text);
	}
}

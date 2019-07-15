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
public class UploadTextObservable extends Observable{
	
	// make it a Singleton
	private static UploadTextObservable instance = new UploadTextObservable();

	// hold the text and color info
	private List text = new ArrayList(2);
	
	// prevent the class from being instantiated
	private UploadTextObservable(){}
	
	//Get the only object available
	public static UploadTextObservable getInstance(){
		return instance;
	}
	
	public void setLine(String line, String color, String whichObserver) {
		text.add(0, line);
		text.add(1, color);
		text.add(2, whichObserver);
		
		setChanged();
		notifyObservers(text);
	}
}

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

	// trying to keep this vaguely thread safe
	private List text = Collections.synchronizedList(new ArrayList(3));
	
	public void setLine(String line, String color, Boolean lineBreak) {
		text.add(0, line);
		text.add(1, color);
		text.add(2, lineBreak);
		
		setChanged();
		notifyObservers(text);
	}
}

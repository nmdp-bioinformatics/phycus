package org.dash.freq.publisher;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Observable;

/**
 *
 * @author katrinaeaton
 */
public class UploadFilesObservable extends Observable{
	
	// make it a Singleton
	private static UploadFilesObservable instance = new UploadFilesObservable();

	// hold the text and color info
	private List text = new ArrayList(3);
	
	// prevent the class from being instantiated
	private UploadFilesObservable(){}
	
	//Get the only object available
	public static UploadFilesObservable getInstance(){
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author katrinaeaton
 */
public class Subject {
	private List<Observer> observers = new ArrayList<Observer>();
	private String line;
	private String color;
	private File file;
	
	public String getLine() {
		return line;
	}
	
	public void setLine(String line) {
		this.line = line;
		notifyAllObservers();
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color.toUpperCase();
		notifyAllObservers();
	}
	
	public File getFile() {
		return file;
	}
	
	public void setFile(File file) {
		this.file = file;
		notifyAllObservers();
	}
	
	public void attach(Observer observer) {
		observers.add(observer);
	}
	
	public void notifyAllObservers() {
		for (Observer observer: observers) {
			observer.update();
		}
	}
}

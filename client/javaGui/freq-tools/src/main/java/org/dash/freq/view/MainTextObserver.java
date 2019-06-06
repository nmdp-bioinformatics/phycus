/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import java.awt.Color;
import java.lang.reflect.Field;
import javax.swing.JTextPane;
import org.dash.freq.controller.Observer;
import org.dash.freq.controller.Subject;

/**
 *
 * @author katrinaeaton
 */
public class MainTextObserver extends Observer{
	public MainTextObserver(Subject subject)
	{
		this.subject = subject;
		this.subject.attach(this);
	}
	
	@Override
	public void update() {
		Color color;
		try {
			Field field = Class.forName("java.awt.Color").getField(subject.getColor());
			color = (Color)field.get(null);
		} catch (Exception e) {
			color = null; // Not defined
		}
		
		AppendText.appendToPane(PhycusGui.outputTextPane, subject.getLine(), color);
		AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
	}
}

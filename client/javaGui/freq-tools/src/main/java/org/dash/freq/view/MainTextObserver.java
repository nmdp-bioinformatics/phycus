/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import java.awt.Color;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import org.dash.freq.controller.UploadTextObservable;

/**
 *
 * @author katrinaeaton
 */
public class MainTextObserver implements Observer{
	public MainTextObserver(UploadTextObservable sub)
	{

	}
	
	@Override
	public void update(Observable sub, Object arg) {
		List text = new ArrayList();
		text = (List) arg;
		String who = text.get(2).toString();
		
		if (who.equals("gui") || who.equals("both")){
			Color color;
			try {
				Field field = Class.forName("java.awt.Color").getField(text.get(1).toString());
				color = (Color)field.get(null);
			} catch (Exception e) {
				color = Color.BLACK; // Not defined
			}

			AppendText.appendToPane(PhycusGui.outputTextPane, text.get(0).toString(), color);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);	
		}
	}
}

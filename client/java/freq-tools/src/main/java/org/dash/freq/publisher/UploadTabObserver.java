package org.dash.freq.publisher;

import java.awt.Color;

import java.lang.reflect.Field;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JTextPane;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.AppendText;

/**
 *
 * @author katrinaeaton
 */
public class UploadTabObserver implements Observer{

	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private JTextPane uploadResultsTextPane = uploadTabClassInstantiations.getUploadResultsTextPaneInstance();

	public UploadTabObserver(UploadFilesObservable sub) { }
	
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

			AppendText.appendToPane(uploadResultsTextPane, text.get(0).toString(), color);
			AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);	
		}
	}
}

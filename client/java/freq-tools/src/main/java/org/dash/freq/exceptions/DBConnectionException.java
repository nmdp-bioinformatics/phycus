/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.exceptions;

import java.awt.Color;

import javax.swing.JTextPane;

import org.dash.freq.utilities.AppendText;
import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.gui.popTab.PopTabClassInstantiations;

/**
 *
 * @author kaeaton
 */
public class DBConnectionException extends Exception {

	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private JTextPane uploadResultsTextPane = uploadTabClassInstantiations.getUploadResultsTextPaneInstance();
	
	private PopTabClassInstantiations popTabClassInstantiations = PopTabClassInstantiations.getPopTabClassInstantiationsInstance();
	private JTextPane popNotificationsTextPane = popTabClassInstantiations.getPopNotificationsTextPaneInstance();
	
	public DBConnectionException() {
		super("Can't connect to the database");
		
		// population pane error
		AppendText.appendToPane(popNotificationsTextPane, "Cannot connect to the database", Color.RED);
		AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
	
		// main upload pane error
		AppendText.appendToPane(uploadResultsTextPane, "Cannot connect to the database", Color.RED);
		AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
	}
}

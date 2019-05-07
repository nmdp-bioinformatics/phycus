/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.model;

import java.awt.Color;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

/**
 *
 * @author kaeaton
 */
public class DBConnectionException extends Exception {
	
	public DBConnectionException()
	{
		super("Can't connect to the database");
		
		// population pane error
		AppendText.appendToPane(PhycusGui.popNotificationsTextPane, "Cannot connect to the database", Color.RED);
		AppendText.appendToPane(PhycusGui.popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
	
		// main upload pane error
		AppendText.appendToPane(PhycusGui.outputTextPane, "Cannot connect to the database", Color.RED);
		AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
	}
}

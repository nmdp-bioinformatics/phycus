package org.dash.freq.gui.uploadTab;

import java.awt.Color;
import java.awt.Font;

import javax.swing.JTextPane;

import org.dash.freq.utilities.StyleGuide;

public class UploadResultsTextPane {

	private static JTextPane uploadResultsTextPane = new JTextPane();

	public UploadResultsTextPane() { }

	public JTextPane getUploadResultsTextPane() {
		// uploadResultsTextPane.setEditable(false);
		uploadResultsTextPane.setFocusable(true);
		uploadResultsTextPane.setFont(StyleGuide.TEXT_AREA_FONT);


		return uploadResultsTextPane;
	}
}
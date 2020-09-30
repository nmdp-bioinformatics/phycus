package org.dash.freq.gui.popTab;

import java.awt.Font;

import javax.swing.JTextPane;

import org.dash.freq.utilities.StyleGuide;

public class PopResultsTextPane {

	private static JTextPane popResultsTextPane = new JTextPane();

	public PopResultsTextPane() { }

	public JTextPane getPopResultsTextPane() {
		popResultsTextPane.setFocusable(true);
		popResultsTextPane.setFont(StyleGuide.MONOSPACE_FONT);

		return popResultsTextPane;

	}
}
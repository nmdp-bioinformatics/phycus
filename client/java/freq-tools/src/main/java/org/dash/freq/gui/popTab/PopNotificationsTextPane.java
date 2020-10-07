package org.dash.freq.gui.popTab;

import java.awt.Font;

import javax.swing.JTextPane;

import org.dash.freq.utilities.StyleGuide;

public class PopNotificationsTextPane {

	private static JTextPane popNotificationsTextPane = new JTextPane();

	public PopNotificationsTextPane() { }

	public JTextPane getPopNotificationsTextPane() {
		popNotificationsTextPane.setFocusable(true);
		popNotificationsTextPane.setFont(StyleGuide.MONOSPACE_FONT);

		return popNotificationsTextPane;
	}
}
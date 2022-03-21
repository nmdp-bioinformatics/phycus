package org.dash.freq.gui.optionsTab.customReceiptPath;

import javax.swing.JFileChooser;

import org.dash.freq.utilities.Prefs;

public class ReceiptPathChooser {
	private JFileChooser jFileChooserReceiptPath = new JFileChooser(Prefs.getCustomReceiptPath());

	public ReceiptPathChooser() { }

	public JFileChooser getReceiptPathChooser() {
		jFileChooserReceiptPath.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

		return jFileChooserReceiptPath;
	}
}
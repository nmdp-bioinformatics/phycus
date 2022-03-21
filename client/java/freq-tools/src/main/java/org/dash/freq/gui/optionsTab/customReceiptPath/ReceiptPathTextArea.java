package org.dash.freq.gui.optionsTab.customReceiptPath;

import java.awt.Font;

import javax.swing.JTextArea;

import org.dash.freq.utilities.Prefs;
import org.dash.freq.utilities.StyleGuide;

public class ReceiptPathTextArea {
	private JTextArea receiptLocationTextArea = new JTextArea();

	public ReceiptPathTextArea() { }

	public JTextArea getReceiptPathTextArea() {
		receiptLocationTextArea.setEditable(false);
		receiptLocationTextArea.setLineWrap(true);
		receiptLocationTextArea.setFocusable(false);
		receiptLocationTextArea.setOpaque(false);
		receiptLocationTextArea.setFont(StyleGuide.TEXT_AREA_FONT);

		receiptLocationTextArea.setText(defaultOrCustomReceiptDirectory());

		return receiptLocationTextArea;
	}

	private String defaultOrCustomReceiptDirectory() {
		if(!Prefs.isThereACustomReceiptPath()) {
			return ("Receipts will be saved in the folder\nthe phycus file was uploaded from.");
		}

		return Prefs.getCustomReceiptPath();
	}
}

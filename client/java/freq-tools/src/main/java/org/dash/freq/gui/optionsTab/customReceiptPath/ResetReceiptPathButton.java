package org.dash.freq.gui.optionsTab.customReceiptPath;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;

import org.dash.freq.gui.optionsTab.OptionsTabClassInstantiations;
import org.dash.freq.utilities.Prefs;

public class ResetReceiptPathButton {

	public ResetReceiptPathButton() { }

	private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();

	public JButton getResetReceiptPathButton() {

		JButton resetReceiptPathButton = new JButton("Reset Receipt Path");

		resetReceiptPathButton.addActionListener(resetReceiptPathListener);

		return resetReceiptPathButton;
	}

	private ActionListener resetReceiptPathListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {

			Prefs.resetCustomReceiptPath();

			// update file chooser
			JFileChooser receiptPathChooser = optionsTabClassInstantiations.getReceiptPathChooserInstance();
			receiptPathChooser.setCurrentDirectory(new File(Prefs.getCustomReceiptPath()));

			// update receipt path textArea
			JTextArea receiptPathTextArea = optionsTabClassInstantiations.getReceiptPathTextAreaInstance();
			receiptPathTextArea.setText("Receipts will be saved in the folder\nthe phycus file was uploaded from.");
		}
	};
}
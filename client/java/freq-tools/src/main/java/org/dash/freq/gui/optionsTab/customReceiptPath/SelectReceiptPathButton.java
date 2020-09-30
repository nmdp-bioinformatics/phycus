package org.dash.freq.gui.optionsTab.customReceiptPath;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;

import org.dash.freq.gui.optionsTab.OptionsTabClassInstantiations;
import org.dash.freq.utilities.Prefs;

public class SelectReceiptPathButton {

	private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();

	private JFileChooser receiptPathChooser = optionsTabClassInstantiations.getReceiptPathChooserInstance();
	private File selectedDirectory;

	public SelectReceiptPathButton() { }

	public JButton getSelectReceiptPathButton() {

		JButton selectReceiptPathButton = new JButton("Select Directory");

		selectReceiptPathButton.addActionListener(selectReceiptPathListener);

		return selectReceiptPathButton;
	}

	private ActionListener selectReceiptPathListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
			receiptPathChooser.setVisible(true);
			int returnValue = receiptPathChooser.showOpenDialog(null);
			if (returnValue == receiptPathChooser.APPROVE_OPTION) {

				// set the file, get the absolute path
				// getSelectedFile() is a Java method, not inconsistantly named
				selectedDirectory = receiptPathChooser.getSelectedFile();
				String absolutePath = selectedDirectory.getAbsolutePath();
				System.out.println(absolutePath);

				Prefs.setCustomReceiptPath(absolutePath);

				// tell the fileChooser where its new default is
				// takes the string from preferences and converts it to a file
				receiptPathChooser.setCurrentDirectory(new File(Prefs.getCustomReceiptPath()));

				// update receipt path textArea
				JTextArea receiptPathTextArea = optionsTabClassInstantiations.getReceiptPathTextAreaInstance();
				receiptPathTextArea.setText(Prefs.getCustomReceiptPath());
			}
		}
	};
}
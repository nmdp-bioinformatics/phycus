package org.dash.freq.gui.optionsTab.reportingOptions;

import java.awt.Color;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JCheckBox;
import javax.swing.JTextPane;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.AppendText;
import org.dash.freq.utilities.Prefs;

public class VerboseReportingCheckBox {

	private JCheckBox verboseReportingCheckBox = new JCheckBox();
	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private JTextPane uploadResultsTextPane = uploadTabClassInstantiations.getUploadResultsTextPaneInstance();

	public VerboseReportingCheckBox() { }

	public JCheckBox getVerboseReportingCheckBox() {
		verboseReportingCheckBox.setText("Verbose Reporting");
		verboseReportingCheckBox.setSelected(Prefs.getVerboseReportingSetting());
		verboseReportingCheckBox.addItemListener(verboseReportingListener);

		return verboseReportingCheckBox;
	}

	public ItemListener verboseReportingListener = new ItemListener() {
		public void itemStateChanged(ItemEvent evt) {
			Prefs.setVerboseReportingSetting(verboseReportingCheckBox.isSelected());

			// notify user when turned on
			if (verboseReportingCheckBox.isSelected()) {
				AppendText.appendToPane(uploadResultsTextPane, "Verbose reporting is on", Color.BLACK);
				AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
			}
			
			// notify user when turned off
			else {
				AppendText.appendToPane(uploadResultsTextPane, "Verbose reporting is off", Color.BLACK);
				AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
			}
		}
	};
}

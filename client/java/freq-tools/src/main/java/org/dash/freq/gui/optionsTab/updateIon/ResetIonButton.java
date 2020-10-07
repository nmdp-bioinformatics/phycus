package org.dash.freq.gui.optionsTab.updateIon;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;

import org.dash.freq.gui.uploadTab.*;
import org.dash.freq.utilities.Prefs;

public class ResetIonButton {
	
	private JButton resetIonButton = new JButton("Reset Ion");
	private OptionsIonPanel optionsIonPanel;

	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private IonPanel uploadTabIonPanel = uploadTabClassInstantiations.getIonPanelInstance();
	// private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();
	// private OptionsIonPanel optionsTabIonPanel = optionsTabClassInstantiations.getOptionsIonPanelInstance();

	public ResetIonButton(OptionsIonPanel optionsIP) {
		this.optionsIonPanel = optionsIP;
	}

	public JButton getResetIonButton() {

		resetIonButton.addActionListener(resetIonListener);

		return resetIonButton;
	}

	private ActionListener resetIonListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
			Prefs.resetIon();

			// refresh main page with new or no ION
			uploadTabIonPanel.updateIonPanel();

			// refresh options page with new or no ION
			optionsIonPanel.updateOptionsTabIonPanel();
		}
	};
}


package org.dash.freq.gui.labelTab;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.dash.freq.gui.ExitButton;

public class LabelTab extends JPanel {
	// private Preferences prefs = Preferences.userNodeForPackage(Gui.class);

	public LabelTab() {
		JLabel selectAllLabelGfe = new JLabel("Check all");
		this.add(selectAllLabelGfe);

		JPanel bottomButtons = new JPanel();
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(exitButton);

		this.add(bottomButtons);
	}

}
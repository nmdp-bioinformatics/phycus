package org.dash.freq.gui.doiTab;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.dash.freq.gui.ExitButton;

public class DoiTab extends JPanel {
	// private Preferences prefs = Preferences.userNodeForPackage(Gui.class);

	public DoiTab() {
		JLabel selectAllLabelGfe = new JLabel("Check all");
		this.add(selectAllLabelGfe);

		JPanel bottomButtons = new JPanel();
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(exitButton);

		this.add(bottomButtons);
	}

}
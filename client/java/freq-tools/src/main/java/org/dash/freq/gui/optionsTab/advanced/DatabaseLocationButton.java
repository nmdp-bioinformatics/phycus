package org.dash.freq.gui.optionsTab.advanced;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;

import org.dash.freq.gui.optionsTab.OptionsTabClassInstantiations;
import org.dash.freq.utilities.Prefs;

public class DatabaseLocationButton {
	
	private JButton databaseLocationButton = new JButton("Database Location");

	// private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();
	// private DatabaseLocationPopup databaseLocationPopupFrame = optionsTabClassInstantiations.getDatabaseLocationPopupInstance();

	public DatabaseLocationButton() { }

	public JButton getDatabaseLocationButton() {

		databaseLocationButton.addActionListener(databaseLocationListener);

		return databaseLocationButton;
	}

	private ActionListener databaseLocationListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
            // databaseLocationPopupFrame.setVisible(true);
		}
	};
}















// private void advancedOptionsButtonActionPerformed(java.awt.event.ActionEvent evt) {                                                      
//         DataBaseLocationPopupFrame.setVisible(true);
//     }

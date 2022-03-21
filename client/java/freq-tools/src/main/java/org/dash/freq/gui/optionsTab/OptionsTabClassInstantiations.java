package org.dash.freq.gui.optionsTab;

import java.awt.Frame;
import java.awt.Window;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

import org.dash.freq.gui.optionsTab.advanced.*;
import org.dash.freq.gui.optionsTab.customReceiptPath.*;
import org.dash.freq.gui.optionsTab.updateIon.*;
// import org.dash.freq.gui.optionsTab.updateIon.updateIonPopup.*;

// import org.dash.freq.gui.ExitButton;

/**
 * Provides a central hub to access the instances of all components
 * that are part of the Options tab that need to be accessed by other 
 * classes within the program.
 *
 * @author Katrina Eaton
 * 
 */

public class OptionsTabClassInstantiations {

	// static variable single_instance of type Singleton 
	private static OptionsTabClassInstantiations single_instance = null;

	// instantiate components
	private JTextArea receiptPathTextArea = new ReceiptPathTextArea().getReceiptPathTextArea();
	private JFileChooser receiptPathChooser = new ReceiptPathChooser().getReceiptPathChooser();

	private OptionsIonPanel optionsIonPanel = new OptionsIonPanel();
	// private Frame ionParentFrame = findParentFrame(optionsIonPanel);
	// private UpdateIonPopup updateIonPopup = new UpdateIonPopup(ionParentFrame, "updateIonPanel", optionsIonPanel);

	// private JPanel advancedPanel = new AdvancedPanel().getAdvancedPanel();
	// private Frame advancedParentFrame = findParentFrame(advancedPanel);
	// private DatabaseLocationPopup databaseLocationPopup = new DatabaseLocationPopup(advancedParentFrame, "database location", advancedPanel);

	private OptionsTabClassInstantiations() { }

	// static method to create instance of Singleton class 
	public static OptionsTabClassInstantiations getOptionsTabClassInstantiationsInstance() { 
		if (single_instance == null) 
			single_instance = new OptionsTabClassInstantiations(); 

		return single_instance; 
	}

	public JTextArea getReceiptPathTextAreaInstance() {
		return receiptPathTextArea;
	}

	public JFileChooser getReceiptPathChooserInstance() {
		return receiptPathChooser;
	}

	// public DatabaseLocationPopup getDatabaseLocationPopupInstance() {
	// 	return databaseLocationPopup;
	// }

	// public UpdateIonPopup getUpdateIonPopupInstance() {
	// 	return updateIonPopup;
	// }

	public OptionsIonPanel getOptionsIonPanelInstance() {
		return optionsIonPanel;
	}

	// private Frame findParentFrame(JPanel childPanel) {
	// 	Window parentWindow = SwingUtilities.windowForComponent(childPanel); 

	// 	// or pass 'this' if you are inside the panel
	// 	Frame parentFrame = null;
	// 	if (parentWindow instanceof Frame) {
	// 	    parentFrame = (Frame)parentWindow;
	// 	}

	// 	return parentFrame;
	// }
}
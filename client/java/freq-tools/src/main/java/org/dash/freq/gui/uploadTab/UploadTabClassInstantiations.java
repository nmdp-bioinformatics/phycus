package org.dash.freq.gui.uploadTab;

import javax.swing.*;

import org.dash.freq.gui.uploadTab.licensingMenu.*;
import org.dash.freq.gui.uploadTab.selectFile.*;
import org.dash.freq.publisher.*;
// import org.dash.freq.utilities.Prefs;

/**
 * Provides a central hub to access the instances of all components
 * that are part of the Populations tab that need to be accessed by other 
 * classes within the program.
 *
 * @author Katrina Eaton
 * 
 */

public class UploadTabClassInstantiations {

	// static variable single_instance of type Singleton 
	private static UploadTabClassInstantiations single_instance = null;

	// components
	private JTextArea fileLocationTextArea = new FileLocationTextArea().getFileLocationTextArea();
	private SelectFileButton selectFileButtonInstance = new SelectFileButton(fileLocationTextArea);
	private LicenseComboBox licenseComboBoxInstance = new LicenseComboBox();
	private IonPanel ionPanelInstance = new IonPanel();
	
	private JTextPane uploadResultsTextPane = new UploadResultsTextPane().getUploadResultsTextPane();
	private JButton uploadButton = new UploadButton(selectFileButtonInstance, uploadResultsTextPane).getUploadButton();

	private UploadTabClassInstantiations() { }

	// static method to create instance of Singleton class 
	public static UploadTabClassInstantiations getUploadTabClassInstantiationsInstance() { 
		if (single_instance == null) 
			single_instance = new UploadTabClassInstantiations(); 
  
		return single_instance; 
	}

	// return component instances
	public JTextArea getUploadFilesTextAreaInstance() {
		return fileLocationTextArea;
	}

	public SelectFileButton getSelectFileButtonInstance() {
		return selectFileButtonInstance;
	}

	public JTextPane getUploadResultsTextPaneInstance() {
		return uploadResultsTextPane;
	}

	public LicenseComboBox getUploadLicenseComboBoxInstance() {
		return licenseComboBoxInstance;
	}

	public JButton getUploadButtonInstance() {
		return uploadButton;
	}

	public IonPanel getIonPanelInstance() {
		return ionPanelInstance;
	}
}
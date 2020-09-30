package org.dash.freq.gui.uploadTab.selectFile;

import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.Prefs;

/**
 * Generates the assembled Upload Files JPanel.
 */
public class UploadFilesPanel {

	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();

	private SelectFileButton selectFileUpload = uploadTabClassInstantiations.getSelectFileButtonInstance();
	private JButton selectFileButton = selectFileUpload.getSelectFileButton();
	private JTextArea fileLocationTextArea = uploadTabClassInstantiations.getUploadFilesTextAreaInstance();
	private JPanel uploadFilesPanel = new JPanel();
	private JScrollPane uploadFilesScrollPane = new JScrollPane(fileLocationTextArea);

	public UploadFilesPanel() { }

	/**
	 * Generates the panel with all select file components (except the file chooser.) 
	 *
	 * @return A JPanel that contains the select file components.
	 */
	public JPanel getUploadFilesPanel() {

		uploadFilesScrollPane.setPreferredSize(new Dimension(400, 90));

		// layout / add them to the uploadFilesPanel
		uploadFilesPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
		uploadFilesPanel.add(selectFileButton);
		uploadFilesPanel.add(uploadFilesScrollPane);

		return uploadFilesPanel;
	}
}
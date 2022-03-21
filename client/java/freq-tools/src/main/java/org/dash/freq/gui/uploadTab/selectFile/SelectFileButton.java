package org.dash.freq.gui.uploadTab.selectFile;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.AppendText;
import org.dash.freq.utilities.Prefs;

/**
 * The button for selecting a file or directory on the upload tab. 
 * It opens a JFileChooser which is used to select a file or directory.
 */
public class SelectFileButton {

	private JFileChooser uploadFileChooser = new UploadFileChooser().getUploadFileChooser();
	private JTextArea fileUploadTextArea;
	private File selectedFile = null;
	private String absolutePath, parentFolder, fileName;

	/**
	 * The class to create and handle the Select File button.
	 *
	 * @param fileUpTextArea the text area to print the chosen 
	 * file or directory to.
	 */
	public SelectFileButton(JTextArea fileUpTextArea) {
		this.fileUploadTextArea = fileUpTextArea;
	}

	/**
	 * Creates the button to trigger the JFileChooser to open. 
	 * 
	 * @return A JButton, complete with listener.
	 */
	public JButton getSelectFileButton() {

		JButton selectFileButton = new JButton("Select File(s)");

		selectFileButton.addActionListener(selectFileListener);

		return selectFileButton;
	}

	private ActionListener selectFileListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
			uploadFileChooser.setVisible(true);
			int returnValue = uploadFileChooser.showOpenDialog(null);
			if (returnValue == uploadFileChooser.APPROVE_OPTION) {

				// set the file, get the names necessary
				selectedFile = uploadFileChooser.getSelectedFile();
				absolutePath = selectedFile.getAbsolutePath();
				parentFolder = selectedFile.getParent();
				fileName = selectedFile.getName();
				System.out.println(fileName);

				Prefs.setUploadPath(absolutePath);
				uploadFileChooser.setCurrentDirectory(new File(Prefs.getUploadPath()));

				fileUploadTextArea.setText(absolutePath);

				// if the absolute path is to a folder, add \*.phycus to the end
				// to indicate all phycus files in the upload folder
				if (selectedFile.isDirectory()) {
					fileUploadTextArea.setText(absolutePath + File.separatorChar + "*.phycus");
				}
			}
		}
	};

	/**
	 * The getter method for the file or directory the user has selected.
	 * 
	 * @return The selected file or directory.
	 */
	public File getTheSelectedFile() {
		try{
			return selectedFile;
		} catch(Exception ex) { System.out.println("SelectFileButton: getTheSelectedFile: " + ex); }

		return null;
	}
}
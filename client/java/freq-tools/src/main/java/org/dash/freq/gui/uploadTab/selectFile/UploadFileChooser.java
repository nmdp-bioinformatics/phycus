package org.dash.freq.gui.uploadTab.selectFile;

import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.JFileChooser;


import org.dash.freq.utilities.Prefs;

/**
 * Generates the File Chooser for what files or directory to upload.
 */
public class UploadFileChooser {
	private JFileChooser uploadFileChooser = new JFileChooser(Prefs.getUploadPath());

	public UploadFileChooser() { }

	/**
	 * Generates the File Chooser for what files or directory to upload.
	 *
	 * @return A JFileChooser set to accept a file or a directory. 
	 * It will not allow multiple files or directories to be chosen.
	 */
	public JFileChooser getUploadFileChooser() {		
		uploadFileChooser.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
		FileNameExtensionFilter filter = new FileNameExtensionFilter("Phycus file", "phycus");
		uploadFileChooser.setFileFilter(filter);

		return uploadFileChooser;
	}
}








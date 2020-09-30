package org.dash.freq.gui.uploadTab.selectFile;

import java.awt.Font;

import javax.swing.JTextArea;

import org.dash.freq.utilities.Prefs;
import org.dash.freq.utilities.StyleGuide;

/**
 * Generates the TextArea to display the file/directory path selected.
 */
public class FileLocationTextArea {
	private JTextArea fileLocationTextArea = new JTextArea();

	public FileLocationTextArea() { }

	/**
	 * Generates the JTextArea for writing the path to what file or directory is currently selected. 
	 * This JTextArea is not focusable or editable by the user.
	 *
	 * @return A JTextArea instance to write the path to the currently 
	 * selected file or folder to.
	 */
	public JTextArea getFileLocationTextArea() {
		fileLocationTextArea.setEditable(false);
		fileLocationTextArea.setLineWrap(true);
		fileLocationTextArea.setFocusable(false);
		fileLocationTextArea.setOpaque(false);
		fileLocationTextArea.setFont(StyleGuide.TEXT_AREA_FONT);
		fileLocationTextArea.setText("Please select a file or folder");

		return fileLocationTextArea;
	}
}











package org.dash.freq.gui.uploadTab;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.io.File;

import javax.swing.JButton;
import javax.swing.JTextPane;

import org.dash.freq.gui.uploadTab.selectFile.*;
import org.dash.freq.publisher.*;
import org.dash.freq.uploadData.*;

import org.dash.freq.utilities.AppendText;

public class UploadButton {

	// Observable
	// private UploadFilesObservable uploadFilesObservable = UploadFilesObservable.getInstance();
	// private UploadTabObserver uploadTabObserver;

	private SelectFileButton selectFileButton;
	private JTextPane uploadResultsTextPane;

	private FileUploader fileUploader = new FileUploader();
	private BulkUploader bulkUploader = new BulkUploader();

	private UploadFilesObservable uploadFilesObservable = UploadFilesObservable.getInstance();
	private UploadTabObserver uploadTabObserver;

	public UploadButton(SelectFileButton selectFileBtn, JTextPane uploadResultsTP) {
		this.selectFileButton = selectFileBtn;
		this.uploadResultsTextPane = uploadResultsTP;
	}

	public JButton getUploadButton() {
		JButton uploadButton = new JButton("Upload");
		uploadButton.setPreferredSize(new Dimension(90, 30));

		uploadButton.addActionListener(uploadListener);

		return uploadButton;
	}

	public ActionListener uploadListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {

			File selectedFile = selectFileButton.getTheSelectedFile();

			if (selectedFile == null) {
				AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
				AppendText.appendToPane(uploadResultsTextPane, "Please select a file or folder", Color.RED);
				AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
				
				return;
			}

			if (selectedFile.isFile()) {
				Runnable fileUpload = new Runnable() {
					public void run() {
						fileUploader.uploadFile(selectedFile);
					}
				};
				
				new Thread (fileUpload).start();

				return;
			}

			if (selectedFile.isDirectory()) {

				Runnable bulkUpload = new Runnable () {
					public void run () {
						bulkUploader.uploadFiles(selectedFile);
					}
				};
				
				new Thread (bulkUpload).start();
				
				return;
			}

				// System.out.println("UploadButton can find the selected file/folder: " + selectedFile.getAbsolutePath());

				// AppendText.appendToPane(uploadResultsTextPane, "Testing: UploadButton posts to uploadResultsTextPane", Color.BLUE);
				// AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
				// AppendText.appendToPane(uploadResultsTextPane, "Testing: UploadButton posts to uploadResultsTextPane, check count", Color.BLACK);
				// AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
				// AppendText.appendToPane(uploadResultsTextPane, "Testing: UploadButton posts to uploadResultsTextPane, check count again", Color.BLACK);
				// AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);

				// // check to make sure there's a file or folder listed in
				// // file location text area
				// if (!fileLocationTextArea.getText().isEmpty()) {

				// 	// for a single file
				// 	if (selectedFile.isFile()) {

				// 		// set up a new Receipt Observer
				// 		ReceiptObserver ro = new ReceiptObserver(upTextMgr, selectedFile);
				// 		try { upTextMgr.addObserver(ro); }
				// 		catch (Exception ex) { 
				// 			System.out.println("Error adding observer"); 
				// 			ex.printStackTrace(); 
				// 		}
						
						// create blank line in TextPane (instead of reseting the whole log)
						// AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
				// 		outputTextPane.setText("");
						
				// 		// list file name
				// 		upTextMgr.setLine((selectedFile.getName() + ":"), "blue", "gui");
				// 		upTextMgr.setLine(("File name: " + selectedFile.getName() + ":"), "blue", "receipt");
						
				// 		// run as background thread so TextPane updates
				// 		Runnable fileUpload = new Runnable() 
				// 		{
				// 			public void run() {
				// 				try {
				// 					PostPopulationFrequencies ppf = new PostPopulationFrequencies();
				// 					ppf.setFile(selectedFile);
				// 					ppf.call();
				// 					System.out.println("Number of observers: " + upTextMgr.countObservers());
				// 					upTextMgr.setLine("", "black", "receipt");
				// 					upTextMgr.setLine("End of receipt", "black", "receipt");
				// 					upTextMgr.deleteObserver(ro);

				// 				} catch (Exception ex) { ex.printStackTrace(); }
				// 			}
				// 		};
				// 		new Thread(fileUpload).start();
				// 	}
				// 	// for multiple files
				// 	else if (!selectedFile.isFile())
				// 	{
				// 		// reset TextPane
				// 		outputTextPane.setText("");
						
				// 		// run batch job in background so TextPane updates
				// 		Runnable batchUpload = new Runnable() 
				// 		{
				// 			public void run() {
				// 				BatchUploader bu = new BatchUploader();
				// 				bu.uploadFiles(selectedFile.toString());
				// 			}
				// 		};
						
				// 		new Thread(batchUpload).start();
				// 	}
				// }
				
				// make sure there is a file selected to prevent crashes
				
			// } catch (Exception e) {
			// 	e.printStackTrace();
			// }
		}
	};
}
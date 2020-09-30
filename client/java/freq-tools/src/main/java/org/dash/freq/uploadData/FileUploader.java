package org.dash.freq.uploadData;

import java.io.File;

import javax.swing.JTextPane;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.publisher.*;

/**
 * This class triggers the file upload process to PostPopulationFrequencies, 
 * first setting the file, then calling the "call()" function which starts the validations 
 * before uploading the data. 
 *
 * @author katrinaeaton
 */
public class FileUploader {

	private UploadFilesObservable uploadFilesObservable = UploadFilesObservable.getInstance();
	private UploadTabObserver uploadTabObserver;
	private ReceiptObserver receiptObserver;

	// private PostPopulationFrequencies postPopFreq = createNewPostPopulationFrequencies();

	private int uploadResults;

	public FileUploader() { }

	/**
	 * Begins the upload process, writing to both the GUI and the receipt.
	 *
	 * @param selectedFile The Phycus file to be uploaded.
	 */
	public int uploadFile(File selectedFile) {

		// set up new Observers
		receiptObserver = new ReceiptObserver(uploadFilesObservable, selectedFile);
		uploadTabObserver = new UploadTabObserver(uploadFilesObservable);

		try { 
			uploadFilesObservable.addObserver(receiptObserver); 
			uploadFilesObservable.addObserver(uploadTabObserver); 
		} catch (Exception ex) { System.out.println("FileUploader: Error adding observer"); ex.printStackTrace(); }
		
		
		try {
			// list file name
			uploadFilesObservable.setLine((selectedFile.getName() + ":"), "blue", "gui");
			uploadFilesObservable.setLine(("File name: " + selectedFile.getName() + ":"), "black", "receipt");

			PostPopulationFrequencies ppf = new PostPopulationFrequencies(
				"gtRegistry", 
				"test");
				// prefs.get("PHY_EST_ENTITY", null));
			ppf.setFile(selectedFile);
			// ppf.call();
			uploadResults = ppf.call();

			System.out.println("Number of observers: " + uploadFilesObservable.countObservers());
			uploadFilesObservable.setLine("", "black", "receipt");
			uploadFilesObservable.setLine("End of receipt", "black", "receipt");
			uploadFilesObservable.deleteObserver(receiptObserver);
			uploadFilesObservable.deleteObserver(uploadTabObserver);

			// return fileUploaded;
		} catch (Exception ex) { ex.printStackTrace(); }
		
		return uploadResults;
	}

	// private PostPopulationFrequencies createNewPostPopulationFrequencies() {

	// 	try {
	// 		PostPopulationFrequencies ppf = new PostPopulationFrequencies("gtRegistry", "test");

	// 		return ppf;

	// 	} catch (Exception ex) { 
	// 		System.out.println("Error creating new PostPopulationFrequencies.");
	// 		ex.printStackTrace();
	// 	}
	// 	return null;
	// }

}
package org.dash.freq.uploadData;

import java.awt.Color;
import java.io.File;
import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.prefs.Preferences;

// import org.dash.freq.model.PostPopulationFrequencies;
// import org.dash.freq.view.AppendText;
// import org.dash.freq.view.PhycusGui;
import org.dash.freq.publisher.*;


/**
 *
 * @author katrinaeaton
 */
public class BulkUploader { 

	private UploadFilesObservable uploadFilesObservable = UploadFilesObservable.getInstance();
	private UploadTabObserver uploadTabObserver;

	public BulkUploader() { }
	
	public void uploadFiles(File folder) {

		// File dir = new File(folder);

		FileUploader fileUploader = new FileUploader();
		
		// track unprocessed files
		// HashMap<String, Boolean> processedFiles = new HashMap<>();
		ArrayList<String> uploadFailedFiles = new ArrayList();
		
		try {
			// instatiate Post Pop Freq
			// PostPopulationFrequencies ppf = new PostPopulationFrequencies();
			
			// for each file in the folder
			for (File file : folder.listFiles()) {
				
				// if file is a csv file
				String fileName = file.getName();
				if (fileName.toLowerCase().endsWith(".phycus")) {

					int fileUploaded = fileUploader.uploadFile(file);
					System.out.println(file.getName() + " was uploaded via BulkUploader");
					System.out.println(fileUploaded + " was the result of uploading via BulkUploader");

					if (fileUploaded != 1) {
						uploadFailedFiles.add(file.getName());
					}
					// create new receipt
					// ro = new ReceiptObserver(upTextMgr, file);
					// try { upTextMgr.addObserver(ro); }
					// catch (Exception ex) { 
					// 	System.out.println("Error adding observer"); 
					// 	ex.printStackTrace(); 
					// }
					
					// print data file name
					// upTextMgr.setLine("", "black", "gui");
					// upTextMgr.setLine((file.getName() + ":"), "blue", "gui");
					// upTextMgr.setLine(("File name: " + file.getName() + ":"), "blue", "receipt");
					
					// set file and process
					// ppf.setFile(file);
					// Boolean processed = ppf.call() != 0;
					// processedFiles.put(file.getName(), processed);
					// upTextMgr.setLine("", "black", "receipt");
					// upTextMgr.setLine("End of receipt", "black", "receipt");
					
					// delete observer for current receipt
					// upTextMgr.deleteObserver(ro);
				}
			}

			printFailedFileNames(uploadFailedFiles);

			// uploadTabObserver = new UploadTabObserver(uploadFilesObservable);
			// uploadFilesObservable.addObserver(uploadTabObserver); 
			
			// print out header for list of files that did not upload
			// uploadFilesObservable.setLine("", "black", "gui");
			// uploadFilesObservable.setLine("Files not uploaded: ", "black", "gui");

			// // cycle through list of file, print files that didn't upload
			// for(String uploadFailedFile : uploadFailedFiles) {
			// 	// if (!entry.getValue()) 
			// 	// {
			// 		uploadFilesObservable.setLine(uploadFailedFile, "red", "gui");
			// 	// }
			// }

			// uploadFilesObservable.deleteObserver(uploadTabObserver);

		} catch (Exception e) { e.printStackTrace(); }
	}

	private void printFailedFileNames(ArrayList<String> failedUploadFiles) {
		// print out header for list of files that did not upload
			uploadFilesObservable.setLine("", "black", "gui");
			uploadFilesObservable.setLine("Files not uploaded: ", "black", "gui");

			// cycle through list of file, print files that didn't upload
			// for(String uploadFailedFile : failedUploadFiles) {
			// 	// if (!entry.getValue()) 
			// 	// {
			// 		uploadFilesObservable.setLine(uploadFailedFile, "red", "gui");
			// 	// }
			// }
			for(int i = 0; i < failedUploadFiles.size(); i++) uploadFilesObservable.setLine(failedUploadFiles.get(i), "red", "gui");
	}
}

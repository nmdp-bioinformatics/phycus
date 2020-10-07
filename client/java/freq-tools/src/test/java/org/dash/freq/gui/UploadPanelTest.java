package org.dash.freq.gui;

// import java.lang.reflect.InvocationTargetException;

import javax.swing.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import static org.mockito.Mockito.*;

import org.dash.freq.gui.uploadTab.*;
import org.dash.freq.gui.uploadTab.selectFile.*;
 
class UploadPanelTest{

	// UploadTab mockedUploadTab = mock(UploadTab.class);

	// private final UploadFilesPanel uploadFilesPanel = new UploadFilesPanel();
	// UploadFilesPanel uploadFilesPanel = mock(UploadFilesPanel.class);
	
	private final JButton testButton = new JButton();
	private final JPanel testPanel = new JPanel();
	private final JTextArea testTextArea = new JTextArea();


	@Test
	@DisplayName("Upload Files Panel testing")
	void objectsTheUploadFilesPanelReturns() {
 		// assertEquals(testPanel.getClass(), uploadFilesPanel.getUploadFilesPanel().getClass(), "Get the file upload Panel");
 		// assertEquals(testTextArea.getClass(), uploadFilesPanel.getUploadFilesTextAreaInstance().getClass(), "Get the file upload TextArea");
 		// assertEquals(testButton.getClass(), uploadFilesPanel.getUploadFileButton().getClass(), "Get the file upload Button");
	}

	@Test
	@DisplayName("Getting the source data")
	void gettingTheFilePathsToUpload() {
		
	}
}


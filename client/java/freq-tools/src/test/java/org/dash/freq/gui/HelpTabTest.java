package org.dash.freq.gui;

import javax.swing.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.dash.freq.gui.helpTab.HelpParser;


class HelpTabTest{

	private final String expectedBeginningOfText = "<p><a name=\"top\">"; // First 17 characters
	private String processedHelpText = getProcessedText();

	private String getProcessedText() {
		String processedResults = "";
		HelpParser helpParser = new HelpParser();

		try {
			processedResults = helpParser.getHelpText();

		} catch (Exception ex) { System.out.println("HelpTabTest: problem processing helptext via helpParser: " + ex ); }

		return processedResults.substring(0, 17);
	}

	@Test
	@DisplayName("Processing the helpMarkdown text file via HelpParser")
	void processingTheHelpMarkdownTextFile() {
 		assertEquals(expectedBeginningOfText, processedHelpText, "Get the helpMarkdown text file from resources and process");
	}
}
package org.dash.freq.gui;

import javax.swing.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.dash.freq.gui.optionsTab.*;
import org.dash.freq.gui.optionsTab.customReceiptPath.*;

class OptionsPanelTest{

	// private final ReceiptPathPanel receiptPathPanel = new ReceiptPathPanel();

	private final JPanel testPanel = new JPanel();
	private final JTextArea testTextArea = new JTextArea();

	@Test
	@DisplayName("Custom receipt path testing")
	void objectsTheReceiptPathPanelReturns() {
 		// assertEquals(testPanel.getClass(), receiptPathPanel.getReceiptPathPanel().getClass(), "Get the select custom receipt location Panel");
 		// assertEquals(testTextArea.getClass(), receiptPathPanel.getReceiptPathTextAreaInstance().getClass(), "Get the select custom receipt location TextArea");
 	}


}
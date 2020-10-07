package org.dash.freq.gui.uploadTab;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JPanel;

import org.dash.freq.utilities.StyleGuide;

public class InstructionsPanel {

	private JPanel instructionsPanel1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
	private JPanel instructionsPanel2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
	private final JLabel label1 = new JLabel("<html><body>You may select individual .phycus files.<br>"
								+ "(See help for more information about the suffix.)<br>"
								+ "You may also select folders of .phycus files.<br>"
								+ "By default subdirectories will be ignored. "
								+ "Non-phycus files are ignored.</body></html>");

	private final JLabel label2 = new JLabel("Warnings will not prevent a file from being uploaded. Errors will.");

	public InstructionsPanel() { }

	public JPanel getInstructionsPanel1() {
		label1.setFont(StyleGuide.LABEL_FONT);

		// instructionsPanel1.setPreferredSize(new Dimension(500, 200));
		instructionsPanel1.add(label1);

		return instructionsPanel1;
	}

	public JPanel getInstructionsPanel2() {
		label2.setFont(StyleGuide.LABEL_FONT);
		
		instructionsPanel2.setPreferredSize(new Dimension(500, 40));
		instructionsPanel2.add(label2);

		return instructionsPanel2;
	}


}
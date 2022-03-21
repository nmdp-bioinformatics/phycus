package org.dash.freq.gui.uploadTab;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.*;

import org.dash.freq.gui.ExitButton;
import org.dash.freq.gui.uploadTab.licensingMenu.*;
import org.dash.freq.gui.uploadTab.selectFile.*;
import org.dash.freq.utilities.Prefs;


public class UploadTab extends JPanel {

	private final int hGap = 10;
	private final int vGap = 0;
	private GridBagConstraints c = new GridBagConstraints();
	private InstructionsPanel instructionPanels = new InstructionsPanel();
	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private IonPanel ionPanelInstance = uploadTabClassInstantiations.getIonPanelInstance();

	public UploadTab() {
		System.out.println("UploadTab started");

		// components
		JPanel selectFilesPanel = new UploadFilesPanel().getUploadFilesPanel();
		JPanel instructionsPanel1 = instructionPanels.getInstructionsPanel1();
		JPanel licensePanel = new LicensePanel().getLicensePanel();
		JPanel ionHousingPanel = ionPanelInstance.getIonHousingPanel();
		JPanel instructionsPanel2 = instructionPanels.getInstructionsPanel2();
		JTextPane uploadResultsTextPane = new UploadResultsTextPane().getUploadResultsTextPane();
		JPanel bottomButtons = new JPanel();
		
		// holding panel for optional ion
		JPanel ionPanel = ionPanelInstance.getIonPanel();
		ionHousingPanel.add(ionPanel);
		// if(Prefs.getIonNumber().equals("")) ionPanel.setVisible(false);

		// restults textPane
		JPanel resultsPanel = new JPanel();
		resultsPanel.setPreferredSize(new Dimension(500, 240));
		JScrollPane uploadResultsScrollPane = new JScrollPane(uploadResultsTextPane);
		uploadResultsScrollPane.setPreferredSize(new Dimension(500, 220));
		resultsPanel.add(uploadResultsScrollPane);

		JButton uploadButton = uploadTabClassInstantiations.getUploadButtonInstance();
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(uploadButton);
		bottomButtons.add(exitButton);

		// layout / add them to the gfePanel
		this.setLayout(new GridBagLayout());
		// c.anchor = GridBagConstraints.FIRST_LINE_START;
		c.anchor = GridBagConstraints.NORTH;
		// c.gridx = GridBagConstraints.RELATIVE;
		c.insets = new Insets(hGap, vGap, hGap, vGap);
		
		// line 0
		addComp(this, selectFilesPanel, 0, 0, 1, 1, GridBagConstraints.EAST, 0.5, 0.0);
		
		// line 1
		// c.anchor = GridBagConstraints.WEST;
		addComp(this, instructionsPanel1, 0, 1, 1, 1, GridBagConstraints.WEST, 0.5, 0.0);

		// line 2
		c.anchor = GridBagConstraints.NORTHWEST;
		addComp(this, licensePanel, 0, 2, 1, 1, GridBagConstraints.BOTH, 0.5, 0.0);

		// line 3
		// c.anchor = GridBagConstraints.NORTH;
		addComp(this, ionHousingPanel, 0, 3, 1, 1, GridBagConstraints.BOTH, 0.5, 0.0);

		// line 4
		c.anchor = GridBagConstraints.NORTH;
		addComp(this, instructionsPanel2, 0, 4, 1, 1, GridBagConstraints.WEST, 0.5, 0.0);

		// line 5
		// c.anchor = GridBagConstraints.NORTH;
		addComp(this, resultsPanel, 0, 5, 1, 1, GridBagConstraints.BOTH, 0.5, 0.0);
		// addComp(this, uploadResultsScrollPane, 0, 5, 1, 1, GridBagConstraints.BOTH, 0.5, 0.0);

		// line 6
		addComp(this, bottomButtons, 0, 6, 1, 1, GridBagConstraints.BOTH, 0.5, 0.0);

	}

	private void addComp(JPanel panel, JComponent comp
						, int x, int y, int gWidth
						, int gHeight, int fill
						, double weightx, double weighty) {
		c.gridx = x;
		c.gridy = y;
		c.gridwidth = gWidth;
		c.gridheight = gHeight;
		c.fill = fill;
		c.weightx = weightx;
		c.weighty = weighty;	  

		panel.add(comp, c);
	}
}
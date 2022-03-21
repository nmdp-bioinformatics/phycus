package org.dash.freq.gui.optionsTab;

import java.awt.Color;
import java.awt.Dimension;
// import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.border.TitledBorder;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSeparator;

import org.dash.freq.gui.ExitButton;
import org.dash.freq.gui.optionsTab.advanced.*;
import org.dash.freq.gui.optionsTab.customReceiptPath.*;
import org.dash.freq.gui.optionsTab.reportingOptions.*;
import org.dash.freq.gui.optionsTab.updateIon.*;

public class OptionsTab extends JPanel {


	// components
	private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();
	private JPanel optionsIonPanel = optionsTabClassInstantiations.getOptionsIonPanelInstance().getOptionsIonPanel();
	private JPanel advancedPanel = optionsTabClassInstantiations.getOptionsIonPanelInstance();

	private JPanel receiptPanel = new ReceiptPathPanel().getReceiptPathPanel();
	private JPanel reportingOptionsPanel = new ReportingOptionsPanel().getReportingOptionsPanel();
	// private JPanel optionsIonPanel = new OptionsIonPanel().getOptionsIonPanel();
	// private JPanel advancedPanel = new AdvancedPanel().getAdvancedPanel();

	public OptionsTab() {

		JPanel bottomButtons = new JPanel();
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(exitButton);

		// layout
		this.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.anchor = GridBagConstraints.NORTH;
		c.weightx = 0.5;
		
		// line 0
		c.gridx = 0;
		c.gridy = 0;
		this.add(receiptPanel, c);
		
		// line 1
		c.gridy = 1;
		this.add(reportingOptionsPanel, c);

		// line 2
		c.gridy = 2;
		this.add(optionsIonPanel, c);

		// line 3
		c.gridy = 3;
		this.add(advancedPanel, c);

		// line 4
		c.gridy = 4;
		c.fill = GridBagConstraints.BOTH;
		this.add(bottomButtons, c);
	}
}
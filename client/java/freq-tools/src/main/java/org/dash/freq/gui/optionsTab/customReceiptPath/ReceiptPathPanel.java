package org.dash.freq.gui.optionsTab.customReceiptPath;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.TitledBorder;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.dash.freq.gui.optionsTab.OptionsTabClassInstantiations;
import org.dash.freq.utilities.StyleGuide;

public class ReceiptPathPanel {

	private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();

	private JButton selectReceiptPathButton = new SelectReceiptPathButton().getSelectReceiptPathButton();
	private JButton resetReceiptPathButton = new ResetReceiptPathButton().getResetReceiptPathButton();
	private JTextArea receiptPathTextArea = optionsTabClassInstantiations.getReceiptPathTextAreaInstance();
	private JPanel receiptPathPanel = new JPanel();
	private JScrollPane receiptPathScrollPane = new JScrollPane(receiptPathTextArea);
	private TitledBorder receiptBorder = BorderFactory.createTitledBorder(StyleGuide.TITLED_BORDER_OUTLINE, "Custom Receipt Path");
	private Border paddingBorder = StyleGuide.EMPTY_BORDER_MARGIN_VERTICAL;

	public ReceiptPathPanel() { }

	public JPanel getReceiptPathPanel() {


		receiptPathPanel.setPreferredSize(new Dimension(500, 175));
		receiptPathPanel.setBorder(new CompoundBorder(paddingBorder, receiptBorder));

		receiptPathScrollPane.setPreferredSize(new Dimension(350, 125));

		// layout / add them to the receiptPathPanel
		receiptPathPanel.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.anchor = GridBagConstraints.WEST;
		c.weightx = 0.5;
		c.weighty = 0.5;
		
		// line 0
		c.gridy = 0;
		c.gridx = 1;
		c.gridheight = 2;
		receiptPathPanel.add(receiptPathScrollPane, c);

		c.gridx = 0;
		c.gridheight = 1;
		receiptPathPanel.add(selectReceiptPathButton, c);

		// line 1
		c.gridy = 1;
		receiptPathPanel.add(resetReceiptPathButton, c);

		return receiptPathPanel;
	}
}
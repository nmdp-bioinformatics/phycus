package org.dash.freq.gui.optionsTab.advanced;

import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.TitledBorder;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;

import org.dash.freq.utilities.StyleGuide;

public class AdvancedPanel {

	private JButton databaseLocationButton = new DatabaseLocationButton().getDatabaseLocationButton();
	private TitledBorder databaseBorder = BorderFactory.createTitledBorder(StyleGuide.TITLED_BORDER_OUTLINE, "Advanced Options");
	private Border paddingBorder = StyleGuide.EMPTY_BORDER_MARGIN_VERTICAL;
	private JPanel advancedPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

	public AdvancedPanel() { }

	public JPanel getAdvancedPanel() {
		advancedPanel.setPreferredSize(new Dimension(500, 80));
		advancedPanel.add(databaseLocationButton);
		advancedPanel.setBorder(new CompoundBorder(paddingBorder, databaseBorder));

		return advancedPanel;
	}
}

package org.dash.freq.gui.optionsTab.reportingOptions;

import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.TitledBorder;
import javax.swing.BorderFactory;
import javax.swing.JCheckBox;
import javax.swing.JPanel;

import org.dash.freq.utilities.StyleGuide;

public class ReportingOptionsPanel {

	private JCheckBox verboseReportingCheckBox = new VerboseReportingCheckBox().getVerboseReportingCheckBox();
	private TitledBorder reportingOptionsBorder = BorderFactory.createTitledBorder(StyleGuide.TITLED_BORDER_OUTLINE, "Reporting Options");
	private Border paddingBorder = StyleGuide.EMPTY_BORDER_MARGIN_VERTICAL;
	private JPanel reportingOptionsPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

	public ReportingOptionsPanel() { }

	public JPanel getReportingOptionsPanel() {
		reportingOptionsPanel.setPreferredSize(new Dimension(500, 70));
		reportingOptionsPanel.add(verboseReportingCheckBox);
		reportingOptionsPanel.setBorder(new CompoundBorder(paddingBorder, reportingOptionsBorder));

		return reportingOptionsPanel;
	}

}

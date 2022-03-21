package org.dash.freq.gui.uploadTab;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import org.dash.freq.utilities.Prefs;
import org.dash.freq.utilities.StyleGuide;

public class IonPanel {

	private JPanel ionPanel;
	private JPanel gapPanel = new JPanel();
	private JPanel ionHousingPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

	public IonPanel() { }

	public JPanel getIonHousingPanel() {
		ionHousingPanel.setPreferredSize(new Dimension(500, 60));

		return ionHousingPanel;
	}

	public JPanel getIonPanel() {

		ionPanel = new JPanel();

		gapPanel.setPreferredSize(new Dimension(20, 60));
		ionPanel.add(gapPanel);

		JLabel label = whichLabel();
		label.setFont(StyleGuide.LABEL_FONT);

		ionPanel.add(label);

		return ionPanel;
	}

	public void updateIonPanel() {
		Component[] components = ionHousingPanel.getComponents();
		ionHousingPanel.remove(components[0]);

		ionPanel = getIonPanel();
		ionHousingPanel.add(ionPanel).revalidate();
		ionHousingPanel.repaint();

		// if(Prefs.getIonNumber().equals("")) ionPanel.setVisible(false);
	}

	private JLabel whichLabel() {
		String ionNumber = Prefs.getIonNumber();
		String ionFacility = Prefs.getIonFacility();

		JLabel ionLabel = new JLabel("<html><body>Issuing Organization Number (ION): "
							+ ionNumber + "<br>"
							+ "ION Facility: " + ionFacility + "</body></html>"
							, SwingConstants.LEFT);
		JLabel noIonLabel = new JLabel("<html><body>Issuing Organization Number (ION) not set.<br>"
								+ "If you have one, it can be set in options.</body></html>"
								, SwingConstants.LEFT);
		
		// which label should be displayed?
		if(Prefs.getIonNumber().equals("")) {
			return noIonLabel;
		}
		
		return ionLabel;
	}
}
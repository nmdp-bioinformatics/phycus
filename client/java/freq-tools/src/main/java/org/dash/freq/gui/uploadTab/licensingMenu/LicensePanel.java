package org.dash.freq.gui.uploadTab.licensingMenu;

import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.StyleGuide;

public class LicensePanel {

	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private LicenseComboBox licenseComboBoxInstance = uploadTabClassInstantiations.getUploadLicenseComboBoxInstance();

	private final JLabel licenseLabel = new JLabel("Licensing Type: ");
	private final JLabel licenseLabelHelpIcon = getHelpIcon();
	private final JComboBox licenseComboBox = licenseComboBoxInstance.getLicenseComboBox();
	private JPanel gapPanel = new JPanel();
	private JPanel licensePanel = new JPanel();
	private JPanel instructionPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
	public LicensePanel() {	}

	public JPanel getLicensePanel() {

		licenseLabel.setFont(StyleGuide.LABEL_FONT);
		
		instructionPanel.add(licenseLabel);
		instructionPanel.add(licenseLabelHelpIcon);

		gapPanel.setPreferredSize(new Dimension(10, 50));

		// layout / add them to the licensePanel
		licensePanel.setPreferredSize(new Dimension(450, 50));
		licensePanel.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.anchor = GridBagConstraints.WEST;
		
		// line 0
		c.gridy = 0;
		c.gridx = 0;
		c.gridheight = 2;
		licensePanel.add(gapPanel, c);

		c.gridheight = 1;
		c.gridx = 1;
		// c.weightx = 1.0;
		licensePanel.add(instructionPanel, c);
		
		c.gridy = 1;
		licensePanel.add(licenseComboBox, c);

		licenseComboBoxInstance.getSelectedLicenseCode();

		return licensePanel;
	}

	private JLabel getHelpIcon() {
		JLabel helpIcon = new JLabel();

		helpIcon.setIcon(new ImageIcon(getClass().getResource("/smallQuestionMark.png")));
		helpIcon.setLabelFor(licenseLabel);
		helpIcon.setToolTipText("A link to a description of the different licensing types");

		helpIcon.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {
				// licenseHelpIconMouseClicked(evt);
				try {
					URI licenseTypes = new URI("https://creativecommons.org/share-your-work/licensing-types-examples/");

					openWebpage(licenseTypes);
				} catch (Exception ex) {
					System.out.println(ex);
				}
			}
		});

		return helpIcon;
	}

	// open links to external browser
	public static void openWebpage(URI uri) {
		Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
		if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE)) {
			try {
				desktop.browse(uri);
			} catch (Exception e) { e.printStackTrace(); }
		}
	}
}


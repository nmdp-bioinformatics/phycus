package org.dash.freq.gui.popTab;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JTextPane;

import org.dash.freq.gui.ExitButton;

/**
 * The populations tab displays the populations in the database and allows
 * for the creation of new populations. The listener that initially populates
 * the results JTextPane is the tab change listener in the Gui class.
 *
 * @author katrinaeaton
 */
public class PopTab extends JPanel {

	private PopTabClassInstantiations popTabClassInstantiations = PopTabClassInstantiations.getPopTabClassInstantiationsInstance();

	private JTextField popSearchTextField = popTabClassInstantiations.getPopSearchTextFieldInstance();
	private JTextPane popResultsTextPane = popTabClassInstantiations.getPopResultsTextPaneInstance();
	private JTextPane popNotificationsTextPane = popTabClassInstantiations.getPopNotificationsTextPaneInstance();
	private UpdatePopulationList updatePopulationList = popTabClassInstantiations.getUpdatePopulationListInstance();

	private JButton popCreateButton = new PopCreateButton().getPopCreateButton();

	private JLabel popLabel = new JLabel("Population name:");

	public PopTab() {

		JPanel popSearchPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		popSearchPanel.add(popLabel);
		popSearchPanel.add(popSearchTextField);

		JScrollPane popResultsScrollPane = new JScrollPane(popResultsTextPane);
		popResultsScrollPane.setPreferredSize(new Dimension(500, 450));

		JScrollPane popNotificationsScrollPane = new JScrollPane(popNotificationsTextPane);
		popNotificationsScrollPane.setPreferredSize(new Dimension(500, 200));

		JPanel bottomButtons = new JPanel();
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(popCreateButton);
		bottomButtons.add(exitButton);

		// layout
		this.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.anchor = GridBagConstraints.NORTH;
		c.weightx = 0.5;
		
		// line 0
		c.gridx = 0;
		c.gridy = 0;
		this.add(popSearchPanel, c);
		
		// line 1
		c.gridy = 1;
		this.add(popResultsScrollPane, c);

		// line 2
		c.gridy = 2;
		this.add(popNotificationsScrollPane, c);

		// line 3
		c.gridy = 3;
		c.fill = GridBagConstraints.BOTH;
		this.add(bottomButtons, c);
	}

	public void startDownloadOnTabSelection() {
		updatePopulationList.downloadAllPopulations();
	}
}
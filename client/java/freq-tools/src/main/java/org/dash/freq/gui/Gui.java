package org.dash.freq.gui;

import java.awt.Dimension;

import java.util.List;

import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.JFrame;
import javax.swing.JTabbedPane;

import org.dash.freq.gui.doiTab.*;
import org.dash.freq.gui.helpTab.*;
import org.dash.freq.gui.labelTab.*;
import org.dash.freq.gui.optionsTab.*;
import org.dash.freq.gui.popTab.*;
import org.dash.freq.gui.uploadTab.*;
import org.dash.freq.uploadData.*;
import org.dash.freq.utilities.Prefs;

import io.swagger.client.model.PopulationData;

public class Gui extends JFrame {

	public static JTabbedPane parentTabbedPane = new JTabbedPane(JTabbedPane.TOP, JTabbedPane.SCROLL_TAB_LAYOUT);

	private UploadTab uploadTab = new UploadTab();
	private PopTab popTab = new PopTab();
	private LabelTab labelTab = new LabelTab();
	private DoiTab doiTab = new DoiTab();
	private OptionsTab optionsTab = new OptionsTab();
	private HelpTab helpTab = new HelpTab();

	public Gui() {
		// jFrame settings
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setPreferredSize(new Dimension(560, 800));
		this.add(parentTabbedPane);

		parentTabbedPane.addChangeListener(whichTabListener);

		// upload tab
		parentTabbedPane.addTab("Upload Files", null, uploadTab, "Upload filed to the database");
		
		// population tab
		parentTabbedPane.addTab("Populations", null, popTab, "Search available populations");
		
		// label tab
		parentTabbedPane.addTab("Labels", null, labelTab, "Search available labels");
		
		// DOI converter tab
		parentTabbedPane.addTab("DOI converter", null, doiTab, "Convert publication IDs");
		
		// options tab
		parentTabbedPane.addTab("Options", null, optionsTab, "Program options");
		
		// help tab
		parentTabbedPane.addTab("Help", null, helpTab, "Help");

		this.pack();
		this.setLocationRelativeTo(null);

		// parentTabbedPane.setSelectedIndex(Prefs.getCurrentTab());

	}

	private ChangeListener whichTabListener = new ChangeListener() {
		@Override
		public void stateChanged(ChangeEvent evt) {
			int selectedIndex = parentTabbedPane.getSelectedIndex();

			int popTabIndex = 1;
			int labelTabIndex = 2;

			if (selectedIndex == popTabIndex) {
				popTab.startDownloadOnTabSelection();
			}

			if (selectedIndex == labelTabIndex) {
				// labelTab.startDownloadOnTabSelection();
			}
			// Prefs.setCurrentTab(selectedIndex);
		}
	};
}
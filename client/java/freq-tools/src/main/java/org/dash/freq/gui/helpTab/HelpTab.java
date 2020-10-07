package org.dash.freq.gui.helpTab;

import java.awt.Dimension;

import javax.swing.JButton;
import javax.swing.JEditorPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import org.dash.freq.gui.ExitButton;


public class HelpTab extends JPanel {

	private JScrollPane helpEditorPaneScrollPane = new JScrollPane();
	private JEditorPane helpEditorPane = new HelpEditorPane().getHelpEditorPane();

	public HelpTab() {

		helpEditorPaneScrollPane.setViewportView(helpEditorPane);
		helpEditorPaneScrollPane.setPreferredSize(new Dimension(530, 700));
		this.add(helpEditorPaneScrollPane);

		JPanel bottomButtons = new JPanel();
		bottomButtons.setPreferredSize(new Dimension(500, 60));
		JButton exitButton = new ExitButton().getExitButton();
		bottomButtons.add(exitButton);

		this.add(bottomButtons);
	}

}
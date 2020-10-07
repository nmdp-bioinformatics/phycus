package org.dash.freq.gui;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;

public class ExitButton {
	public ExitButton() { }

	public static JButton getExitButton() {
		JButton exitButton = new JButton("Exit");
		exitButton.setPreferredSize(new Dimension(90, 30));

		exitButton.addActionListener(closeListener);

		return exitButton;
	}

	public static ActionListener closeListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
			System.exit(0);
		}
	};
}

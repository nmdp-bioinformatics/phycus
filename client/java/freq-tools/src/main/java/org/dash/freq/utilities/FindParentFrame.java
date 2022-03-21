package org.dash.freq.utilities;

import java.awt.Component;
import java.awt.Frame;
import java.awt.Window;

import javax.swing.JPanel;
import javax.swing.SwingUtilities;

/**
 * Finds the parent frame of a component. This is usually used as a reference 
 * for opening a dialog window.
 */
public class FindParentFrame {

	public FindParentFrame() { }

	/**
	 * Finds the parent frame of a component. This is usually used as a reference 
	 * for opening a dialog window.
	 * 
	 * @param childComponent the component you need to find the parent frame for.
	 * @return the parent frame.
	 */
	public static Frame getParentFrame(Component childComponent) {
		// pass 'this' if you are inside the panel

		Window parentWindow = SwingUtilities.windowForComponent(childComponent); 

		Frame parentFrame = null;
		if (parentWindow instanceof Frame) {
		    parentFrame = (Frame)parentWindow;
		}

		return parentFrame;
	}
}
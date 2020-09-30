package org.dash.freq.utilities;

import java.awt.Desktop;
import java.net.URI;

/**
 * A helper class that allows the program to open webpages in an external browser.  
 */
public class OpenWebpage {

	private OpenWebpage() { }

	/**
	 * Opens the specified URI in the default web browser. 
	 * 
	 * @param uri the Uniform Resource Identifier you would like to open.
	 */
	public static void openWebpage(URI uri) {
		Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
		if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE)) {
			try {
				desktop.browse(uri);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}

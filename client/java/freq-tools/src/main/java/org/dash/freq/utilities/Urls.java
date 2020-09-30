package org.dash.freq.utilities;

import java.net.MalformedURLException;
import java.net.URL;

/** Converts strings to URLs. */
public class Urls {

	private Urls() { }

	/**
	 * Converts a string into a URL. 
	 * Done separately so there aren't extraneous try/catch blocks 
	 * throughout the program.
	 * 
	 * @param urlString The string you want to convert.
	 * @throws MalformedURLException
	 * @return A URL.
	 */
	public static URL finalUrl(String urlString) {
		try {
			return new URL(urlString);
		} catch(MalformedURLException muex) {
			throw new Error(muex);
		} catch(Exception ex) {
			System.out.println("Error creating new URL (utilities.Urls): " + ex);
			throw new Error(ex);
		}
	}
}
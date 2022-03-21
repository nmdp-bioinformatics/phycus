/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.utilities;

import java.awt.Color;
import java.awt.Font;

import javax.swing.JTextPane;
import javax.swing.text.AttributeSet;
import javax.swing.text.Document;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;
import javax.swing.text.StyledDocument;

/**
 * A shortcut for appending text to any JTextPane within the program, 
 * specifying the text color. 
 */
public class AppendText {
	
	
	public AppendText() { }
	
	/**
	 * The method for appending text to any JTextPane within the program. 
	 * It allows for choice of text color. This function will append directly after 
	 * the last text in the window, if you would like a new line, you need to pass 
	 * a system line separator.
	 * 
	 * @param tp The JTextPane you want to append to.
	 * @param msg The text you want to append. This can also be a system line separator.
	 * @param c The color you want the appended text to be. 
	 */
	public static void appendToPane(JTextPane tp, String msg, Color c) {

		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet aset = sc.addAttribute(SimpleAttributeSet.EMPTY, StyleConstants.Foreground, c);
		// aset = sc.addAttribute(aset, StyleConstants.FontFamily, "Lucida Console");
		// aset = sc.addAttribute(aset, StyleConstants.Alignment, StyleConstants.ALIGN_JUSTIFIED);

		int len = tp.getDocument().getLength();

		tp.setCaretPosition(len);
		tp.setCharacterAttributes(aset, false);
		tp.replaceSelection(msg);
	}
}

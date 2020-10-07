package org.dash.freq.utilities;

import java.awt.Color;
import java.awt.Font;

import javax.swing.border.Border;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder; 
import javax.swing.BorderFactory;

/**
 * A class for tracking the different styles used throughout the program  
 */
public class StyleGuide {

	public static final Font LABEL_FONT = new Font("Sans_serif", Font.PLAIN, 14);
	public static final Font TEXT_AREA_FONT = new Font("Sans_serif", Font.PLAIN, 13);
	public static final Font MONOSPACE_FONT = new Font("Courier New", Font.PLAIN, 13);

	public static final Border TITLED_BORDER_OUTLINE = BorderFactory.createLineBorder(Color.GRAY);
	public static final Border EMPTY_BORDER_MARGIN_VERTICAL = new EmptyBorder(10,0,10,0);
	public static final Border EMPTY_BORDER_MARGIN_HORIZONTAL = new EmptyBorder(0,30,0,30);
	public static final Border EMPTY_BORDER_ZERO = new EmptyBorder(0,0,0,0);






	public StyleGuide() { }
}
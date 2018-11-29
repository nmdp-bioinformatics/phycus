/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.gui;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import javax.swing.SwingUtilities;

/**
 *
 * @author katrinaeaton
 */
public class GUIConsole {
	public GUIConsole()
	{
		
	}
 
//The following codes set where the text get redirected. In this case, jTextArea1    
	private void updateTextArea(final String text) 
	{
		SwingUtilities.invokeLater(new Runnable() 
		{
			public void run() 
			{
				GUIJFrame.outputTextArea.append(text);
			}
		});
	}
 
	// invoked in the main method of GUIjFrame
	protected void redirectSystemStreams() 
	{
		OutputStream out = new OutputStream() 
		{
			@Override
			public void write(int b) throws IOException 
			{
				updateTextArea(String.valueOf((char) b));
			}

			@Override
			public void write(byte[] b, int off, int len) throws IOException 
			{
				updateTextArea(new String(b, off, len));
			}

			@Override
			public void write(byte[] b) throws IOException 
			{
				write(b, 0, b.length);
			}
		};

		System.setOut(new PrintStream(out, true));
		System.setErr(new PrintStream(out, true));
	}
}

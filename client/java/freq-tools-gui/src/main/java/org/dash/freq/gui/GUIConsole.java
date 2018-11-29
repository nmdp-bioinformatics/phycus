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
	public GUIConsole(){
		
	}
	//The run method is just a method I create to test the output. You can call it in the constructor methods after initComponents(); , or you can try to do a System.out.println(); in the about box action
 
	public void run()
	{
		redirectSystemStreams();
		System.out.println("THIS IS A DEMO FOR REDIRECTING OUTPUT TO GUI");


		System.out.println("--------------------------------------------");

		for(int i = 0; i < 30; i++)
		{
			System.out.print(Math.random()+"\t");
			System.out.println("<<End");
		}

		System.out.println("--------------------------------------------");


	}
     
//The following codes set where the text get redirected. In this case, jTextArea1    
	private void updateTextArea(final String text) {
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				GUIJFrame.outputTextArea.append(text);
			}
		});
	}
 
//Followings are The Methods that do the Redirect, you can simply Ignore them. 
	protected void redirectSystemStreams() {
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

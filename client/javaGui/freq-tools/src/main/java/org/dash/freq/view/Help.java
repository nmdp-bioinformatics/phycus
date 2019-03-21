
package org.dash.freq.view;

import java.net.URL;
import java.nio.file.*;
import javax.swing.text.Document;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLEditorKit;
import org.commonmark.node.*;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;

    
/**
 *
 * @author kaeaton
 */
public class Help {
	
	public Help(){
		
	}
	
	public static String getHelpText() throws Exception
	{
		String helpText = "";
		String parsedText = "";

		try
		{
			// find help.txt from resources in the jar
			URL fileLocation = ClassLoader.getSystemClassLoader().getResource("help.txt");
			Path filePath= Paths.get(fileLocation.toURI());
			
			// convert that file into a string
			helpText = new String(Files.readAllBytes(filePath));
			
			Parser parser = Parser.builder().build();
			Node document = parser.parse(helpText);
			HtmlRenderer renderer = HtmlRenderer.builder().escapeHtml(true).build();
			parsedText = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"


			
			
			
		
		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
		}
		
		return parsedText;
	}
}

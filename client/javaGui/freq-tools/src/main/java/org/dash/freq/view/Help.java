
package org.dash.freq.view;

import java.net.URL;
import java.nio.file.*;
import java.util.Arrays;
import java.util.List;
//import javax.swing.text.Document;
//import javax.swing.text.html.HTMLDocument;
//import javax.swing.text.html.HTMLEditorKit;
import org.commonmark.Extension;
import org.commonmark.node.*;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.ext.heading.anchor.HeadingAnchorExtension;

    
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
			
			List<Extension> extensions = Arrays.asList(HeadingAnchorExtension.create());
			Parser parser = Parser.builder()
					.extensions(extensions)
					.build();
			HtmlRenderer renderer = HtmlRenderer.builder()
					.extensions(extensions)
					.build();
			
//			Parser parser = Parser.builder().build();
			Node document = parser.parse(helpText);
//			HtmlRenderer renderer = HtmlRenderer.builder().escapeHtml(true).build();
			parsedText = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"


			
			
			
		
		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
		}
		
		return parsedText;
	}
}

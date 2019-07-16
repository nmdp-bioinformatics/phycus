
package org.dash.freq.view;

import java.net.URL;
import java.nio.file.*;
import java.util.Arrays;
import java.util.List;

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
			URL fileLocation = ClassLoader.getSystemClassLoader().getResource("helpMarkdown.txt");
			Path filePath = Paths.get(fileLocation.toURI());
			
			// convert that file into a string
			helpText = new String(Files.readAllBytes(filePath));
			
			// add heading anchor extension to the parser
			List<Extension> extensions = Arrays.asList(HeadingAnchorExtension.create());
			
			// build the parser and renderer
			Parser parser = Parser.builder()
					.extensions(extensions)
					.build();
			HtmlRenderer renderer = HtmlRenderer.builder()
					.extensions(extensions)
					.build();
			
			// parse and render the document
			Node document = parser.parse(helpText);
			parsedText = renderer.render(document);
		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
		}
		
		return parsedText;
	}
}


package org.dash.freq.gui.helpTab;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.stream.*;

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
public class HelpParser {
	
	public HelpParser(){ }
	
	public String getHelpText() throws Exception
	{
		String helpText = "";
		String parsedText = "";

		try
		{
			// find helpMarkdown.txt from resources in the jar. This has to be done as a stream because
			// we're compiling down to a single jar file. (There is no longer a URL to the file.)
			InputStream fileStream = this.getClass().getClassLoader().getResourceAsStream("helpMarkdown.txt");

			// convert that stream into a string
			helpText = new BufferedReader(new InputStreamReader(fileStream, StandardCharsets.UTF_8))
										.lines()
										.collect(Collectors.joining("\n"));

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
			System.out.println("HelpParser: " + ex);
		}
		
		return parsedText;
	}
}

package org.dash.freq.gui.helpTab;

import java.awt.Dimension;

import java.net.URI;

import javax.swing.event.HyperlinkEvent;
import javax.swing.event.HyperlinkListener;
import javax.swing.JEditorPane;

import org.dash.freq.utilities.OpenWebpage;
import org.dash.freq.utilities.StyleGuide;

public class HelpEditorPane{

	private HelpParser helpParser = new HelpParser();
	private JEditorPane jEditorPane = new JEditorPane();

	public HelpEditorPane() { }

	public JEditorPane getHelpEditorPane() {
		jEditorPane.setEditable(false);
		jEditorPane.setContentType("text/html");
		jEditorPane.addHyperlinkListener(hyperlinkListener);
		jEditorPane.putClientProperty(JEditorPane.HONOR_DISPLAY_PROPERTIES, Boolean.TRUE);
		jEditorPane.setFont(StyleGuide.LABEL_FONT);

		try {
			jEditorPane.setText(helpParser.getHelpText());
		} catch(Exception ex) {
			System.out.println("HelpEditorPane: Error setting text to the help EditorPane: " + ex);
		}

		jEditorPane.setCaretPosition(0);

		return jEditorPane;
	}

	private HyperlinkListener hyperlinkListener = new HyperlinkListener() {
	    public void hyperlinkUpdate(HyperlinkEvent evt) {
	        // helpEditorPaneHyperlinkUpdate(evt);
	        // the editor pane has to be told to respond to hyperlinks
			if(evt.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {
				
				// get the descriptions in the link
				String desc = evt.getDescription();
				
				// find non-anchor urls
				if (desc == null || !desc.startsWith("#"))
				{
					try {
						// get the uri from the description and open the page
						URI helpUri = new URI(desc);
						OpenWebpage.openWebpage(helpUri);
					} catch (Exception ex){System.out.println(ex);}
				}
				
				// select the first substring (ideally only substring), name
				desc = desc.substring(1);
				
				// go to the anchor
				jEditorPane.scrollToReference(desc);
		    }
		}
	};
}
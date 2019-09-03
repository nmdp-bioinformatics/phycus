
package org.dash.freq.controller;

import java.io.BufferedInputStream;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

/**
 * Important how to:
 * https://www.mkyong.com/java/how-to-read-xml-file-in-java-dom-parser/
 */

public class IonCheck {
	
	private final String fileLocation = "https://www.iccbba.org/docs/tech-library/database/grid-issuing-organizations-data-file.xml";

	public IonCheck() {
		
	}
	
	public String[] checkIon(String enteredIon) {
		String[] results = {"", ""};
		BufferedInputStream input;
		try {
			// open the file
			input = new BufferedInputStream(new URL(fileLocation).openStream());

			// build and parse the xml document
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(input);
			
			// collect all the Issuing_Organization nodes
			NodeList nList = doc.getElementsByTagName("Issuing_Organization");
			
			// cycle through the nodes
			for (int i = 0; i < nList.getLength(); i++) {

				Node nNode = nList.item(i);
				
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					// get elements at that node
					Element eElement = (Element) nNode;

					System.out.println("ION: " + eElement.getElementsByTagName("ION").item(0).getTextContent());
					System.out.println("ION name: " + eElement.getElementsByTagName("Issuing_Organization_Name").item(0).getTextContent());
				
					// if the ION entered matches the ION in a node, assign to results, break the loop
					if(enteredIon.equals(eElement.getElementsByTagName("ION").item(0).getTextContent())) {
						results[0] = eElement.getElementsByTagName("ION").item(0).getTextContent();
						results[1] = eElement.getElementsByTagName("Issuing_Organization_Name").item(0).getTextContent();
						break;
					}
				}
			}
			
			// close the buffer
			input.close();
			
			// return results
			return results;
			
		} catch (Exception ex) { System.out.println("creating the URL for ION check failed: " + ex); }
		return results;
	}
}

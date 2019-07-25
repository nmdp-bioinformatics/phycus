/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import io.swagger.client.model.PopulationData;
import java.awt.Color;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author katrinaeaton
 */
public class PopulationList {

	public PopulationList() {

	}

	public void updatePopulation(String searchTerms, List<PopulationData> pops) {
		
		List<PopulationData> matchingPopList = new ArrayList();
		
		Pattern p = Pattern.compile(searchTerms.toUpperCase());
		
		// search through the list for matches
		for(PopulationData pop:pops) {
			// check name
			Matcher m = p.matcher(pop.getName().toUpperCase());
			if (m.find()) matchingPopList.add(pop);
			else {
				// check description
				m = p.matcher(pop.getDescription().toUpperCase());
				if (m.find()) matchingPopList.add(pop);
			}
		}
		
		// clear text pane
		PhycusGui.popResultsTextPane.setText("");

		// list the populations
		for (PopulationData pop : matchingPopList) {
			AppendText.appendToPane(PhycusGui.popResultsTextPane, (String.format("%-25s", pop.getName())), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, pop.getDescription(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, System.lineSeparator(), Color.BLACK);
		}
	}
}

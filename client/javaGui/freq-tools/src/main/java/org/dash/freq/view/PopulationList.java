/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import io.swagger.client.model.PopulationData;
import java.awt.Color;
import java.util.List;
import org.dash.freq.model.Population;

/**
 *
 * @author katrinaeaton
 */
public class PopulationList {
	public PopulationList ()
	{
		
	}
	
	public void updatePopulation (String searchTerms, List<PopulationData> pops)
	{
		for (PopulationData pop : pops) {
			AppendText.appendToPane(PhycusGui.popResultsTextPane, String.format("%-30s", pop.getName()), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, pop.getDescription(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, System.lineSeparator(), Color.BLACK);
		}
	}
}

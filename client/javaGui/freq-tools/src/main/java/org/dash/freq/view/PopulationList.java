/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;


import io.swagger.client.model.PopulationData;
import java.awt.Color;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;
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
//			AppendText.appendToPane(PhycusGui.popResultsTextPane, StringUtils.rightPad(pop.getName(), 30), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, (String.format("%-25s", pop.getName())), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, pop.getDescription(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.popResultsTextPane, System.lineSeparator(), Color.BLACK);
		}
	}
}

package org.dash.freq.gui.popTab;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.*;
import java.util.Set;

import javax.swing.JTextPane;

import org.dash.freq.uploadData.Population;
import org.dash.freq.utilities.AppendText;

import io.swagger.client.model.PopulationData;


/**
 * Provides the functions for populating and updating the populations
 * listed in the Populations tab. This does not include talking to the
 * database (That's the Population class in uploadData.)
 *
 * @author katrinaeaton
 */
public class UpdatePopulationList {

	private Population populationClass;

	private volatile List<PopulationData> populationsData;
	private List<PopulationData> filteredPopulationsData = new ArrayList();
	private JTextPane popResultsTextPane;
	// private static volatile boolean exit = false;

	public UpdatePopulationList(JTextPane popResultsTP, Population popClass) {
		this.popResultsTextPane = popResultsTP;
		this.populationClass = popClass;
	}
	
	public void updatePopulationsDisplayed (String searchTerm) {
		// clear text pane
		popResultsTextPane.setText("");
		
		filteredPopulationsData = filterPopulationData(searchTerm, populationsData);

		if(filteredPopulationsData.isEmpty()) { 

			AppendText.appendToPane(popResultsTextPane, "There are no populations", Color.BLACK);

		} else {

			// list the populations
			for (PopulationData pop : filteredPopulationsData) {
				AppendText.appendToPane(popResultsTextPane, (String.format("%-25s", pop.getName())), Color.BLACK);
				AppendText.appendToPane(popResultsTextPane, pop.getDescription(), Color.BLACK);
				AppendText.appendToPane(popResultsTextPane, System.lineSeparator(), Color.BLACK);
			}

			// resets the cursor to the top so the textpane displays properly
			popResultsTextPane.setCaretPosition(0);
		}
	}

	public void downloadAllPopulations() {

		Runnable getPopulations = new Runnable() {
			public void run() {

				// popResultsTextPane.setText("");
				popResultsTextPane.setText("Please wait...");
				
				try { 
					System.out.println("UpdatePopulationList: Download all populations runnable: downloading the populations from the database");
					populationsData = populationClass.getPopulationsFromDB(); 

					System.out.println("UpdatePopulationList: Download all populations runnable: updating the results textPane after downloading pops");
					updatePopulationsDisplayed("");

					return;
				}
				catch (Exception ex) {
					popResultsTextPane.setText("Population.java: problem downloading data: " + ex);
					System.out.println("Population.java: problem downloading data: " + ex);
					ex.printStackTrace(); 
				}
			}
		};

		Thread popDownloadThread = new Thread(getPopulations, "DownloadPops");
		popDownloadThread.start();

		System.out.println("UpdatePopulationList.java: starting thread " + popDownloadThread.getName() + ": "
							+ popDownloadThread.getId());

		Set<Thread> threads = Thread.getAllStackTraces().keySet();
 
		for (Thread t : threads) {
			String name = t.getName();
			Thread.State state = t.getState();
			int priority = t.getPriority();
			String type = t.isDaemon() ? "Daemon" : "Normal";
			System.out.printf("%-20s \t %s \t %d \t %s\n", name, state, priority, type);
		}
	}

	private List<PopulationData> filterPopulationData (String searchTerm, List<PopulationData> filteredPopsData) {
		// filter names by search term
		List<PopulationData> matchingPopList = new ArrayList();
		
		Pattern p = Pattern.compile(searchTerm.toUpperCase());
		
		if (filteredPopsData != null && !filteredPopsData.isEmpty()) {

			// search through the list for matches
			for(PopulationData population:filteredPopsData) {
				// check name
				Matcher m = p.matcher(population.getName().toUpperCase());
				if (m.find()) matchingPopList.add(population);
				else {
					// check description
					m = p.matcher(population.getDescription().toUpperCase());
					if (m.find()) matchingPopList.add(population);
				}
			}
		}
		
		// filteredPopsData = searched populationsData
		return matchingPopList;
	}

	public List<PopulationData> getDownloadedPopulationsData() {
		return populationsData;
	}
}
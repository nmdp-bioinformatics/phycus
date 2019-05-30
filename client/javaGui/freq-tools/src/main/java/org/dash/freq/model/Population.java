/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.model;

import io.swagger.client.ApiClient;
import io.swagger.client.ApiException;
import io.swagger.client.api.DefaultApi;
import io.swagger.client.api.PopulationApi;
import io.swagger.client.model.HFCurationRequest;
import io.swagger.client.model.PopulationData;
import io.swagger.client.model.PopulationRequest;
import io.swagger.client.model.PopulationResponse;
import java.awt.Color;
import java.io.IOException;

import java.net.ConnectException;
import java.net.URL;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.prefs.Preferences;
import org.dash.freq.view.AppendText;

import org.dash.freq.view.PhycusGui;

/**
 *
 * @author katrinaeaton
 */
public class Population 
{
	// access to prefs
	public Preferences prefs = Preferences.userNodeForPackage(PhycusGui.class);
	
	private final String url = new String(prefs.get("PHY_DB_URL", PhycusGui.defaultDatabaseURL));
	
//	public List<PopulationData> popList = new ArrayList<>();
//	ApiClient apiClient = new ApiClient();
//	private DefaultApi api;
//	private PopulationApi popApi;
	
	public Population()
	{

	}
	
	public List<PopulationData> getPopulationsFromDB() throws DBConnectionException
			
	{
		// open connection to the db
		ApiClient apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url);
		
		// access to the Population API
		PopulationApi popApi = new PopulationApi(apiClient);
		System.out.println("popApi set");
		
		// retrieved population storage
		List<PopulationData> popList; //= new ArrayList<>();

		try 
		{
			// get all the populations and populate the list
			PopulationResponse popResponse = popApi.getAllPopulations(); 
			System.out.println("opened popResponse");
			popList = popResponse.getPopulationList();
			System.out.println("retrieved populations");

			System.out.println("popList: " + popList);
			
			if (popList == null || popList.isEmpty())
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, "No populations retrieved from the database", Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				AppendText.appendToPane(PhycusGui.outputTextPane, "Check Populations tab to confirm populations exist", Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
				popList = Collections.emptyList();
			}
		}
		catch (ApiException ex) 
		{ 
			ex.printStackTrace();
			
			// notify user that there was a problem connecting to the db
			throw new DBConnectionException();
		}
		
		return popList;
	}
	
	public List<String> getPopulationNames(List<PopulationData> populations)
	{
		List<String> popNames = new ArrayList<>();
		
		for (PopulationData population : populations) 
		{
			popNames.add(population.getName());
		}
		
		System.out.println("popNames: " + popNames);
		
		return popNames;
	}
	
	public PopulationData getPopulation(List<PopulationData> populations, String searchedPop)
	{
		PopulationData foundPopulation = new PopulationData();
		
		for (PopulationData populationName : populations) 
		{
			if (populationName.getName().equals(searchedPop))
			{
				foundPopulation = populationName;
			}
		}
		
		return foundPopulation;
	}
	
	public void createNewPopulation(String popName, String popDesc)
	{
		

		// open connection to the db
		ApiClient apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url);
		System.out.println("Api set");

		// access to the Population API
		PopulationApi popApi = new PopulationApi(apiClient);
		System.out.println("popApi set");
		
		// create the request
		PopulationRequest populationRequest = new PopulationRequest();

		populationRequest.setName(popName);
		populationRequest.setDescription(popDesc);

		System.out.println("Creating population: " + populationRequest.getName());

		// try to upload the new population
		try { popApi.createPopulation(populationRequest); }
		catch (Exception ex) { ex.printStackTrace(); }
	}
	
//	public void popWithDescription()
//	{
//		if (popName == null || popName.equals(""))
//		{
//			popFlag = false;
//			
//			AppendText.appendToPane(PhycusGui.popNotificationsTextPane, "The population name cannot be blank", Color.RED);
//			AppendText.appendToPane(PhycusGui.popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
//				
//			javax.swing.JOptionPane.showMessageDialog(this,
//				("The population name cannot be blank"),
//				 "Houston, we have a problem",
//				 javax.swing.JOptionPane.ERROR_MESSAGE);
//		}
//	}
}

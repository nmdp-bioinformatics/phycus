/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.uploadData;

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
import java.util.List;

import javax.swing.JTextPane;

import org.dash.freq.exceptions.*;
import org.dash.freq.gui.Gui;
import org.dash.freq.utilities.AppendText;

import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.gui.popTab.PopTabClassInstantiations;

/**
 *
 * @author katrinaeaton
 */
public class Population {
	
	private final String url = new String("http://localhost:8080");
	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
	private JTextPane uploadResultsTextPane = uploadTabClassInstantiations.getUploadResultsTextPaneInstance();
	private List<PopulationData> populations;

	// private PopTabClassInstantiations popTabClassInstantiations = PopTabClassInstantiations.getPopTabClassInstantiationsInstance();
	// private JTextPane popResultsTextPane; // = popTabClassInstantiations.getPopResultsTextPaneInstance();
	// private JTextPane popNotificationsTextPane; // = popTabClassInstantiations.getPopNotificationsTextPaneInstance();

//	public List<PopulationData> popList = new ArrayList<>();
	ApiClient apiClient;
//	private DefaultApi api;
//	private PopulationApi popApi;
	
	// public Population(JTextPane popResultsTP, JTextPane popNotificationsTP) {
	// 	this.popResultsTextPane = popResultsTP;
	// 	this.popNotificationsTextPane = popNotificationsTP;
	// }
	
	public Population() { }

	public List<PopulationData> getPopulationsFromDB() throws DBConnectionException {

		// open connection to the db
		apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url);
		
		// access to the Population API
		PopulationApi popApi = new PopulationApi(apiClient);
		System.out.println("popApi set");
		
		// retrieved population storage
		List<PopulationData> popList = new ArrayList<>();

		try {
			// get all the populations and populate the list
			PopulationResponse popResponse = popApi.getAllPopulations(); 
			System.out.println("Population class: getPopulationsFromDB(): opened popResponse");
			popList = popResponse.getPopulationList();
			System.out.println("Population class: getPopulationsFromDB(): retrieved populations");

			// System.out.println("popList: " + popList);
			
			
			// if (popList == null || popList.isEmpty())
			// {
			// 	AppendText.appendToPane(popResultsTextPane, "No populations retrieved from the database", Color.RED);
			// 	AppendText.appendToPane(popResultsTextPane, System.lineSeparator(), Color.BLACK);
			// 	// AppendText.appendToPane(uploadResultsTextPane, "Check Populations tab to confirm populations exist", Color.RED);
			// 	// AppendText.appendToPane(uploadResultsTextPane, System.lineSeparator(), Color.BLACK);
			// 	// throw new NullPointerException("No populations retrieved from the database"); 
			// }
		} catch (ApiException ex) { 

			ex.printStackTrace();
			
			// notify user that there was a problem connecting to the db
			throw new DBConnectionException();
		}
		
		return popList;
	}
	
	public List<String> getPopulationNames(List<PopulationData> pops) {
		List<String> popNames = new ArrayList<>();

		if (!pops.isEmpty()) {

			for (PopulationData populationName : pops) {
				popNames.add(populationName.getName());
			}
		}
		
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
		System.out.println("Population class: createNewPopulation(): popApi set");
		
		// create the request
		PopulationRequest populationRequest = new PopulationRequest();

		populationRequest.setName(popName);
		populationRequest.setDescription(popDesc);

		System.out.println("Population class: createNewPopulation(): Creating population: " + populationRequest.getName());

		// try to upload the new population
		try { popApi.createPopulation(populationRequest); }
		catch (Exception ex) { 
			System.out.println("Population.java: Error creating the new population: " + ex);
			ex.printStackTrace(); }
	}
}

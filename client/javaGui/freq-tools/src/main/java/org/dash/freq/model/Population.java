/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.model;

import io.swagger.client.ApiClient;
import io.swagger.client.api.DefaultApi;
import io.swagger.client.api.PopulationApi;
import io.swagger.client.model.HFCurationRequest;
import io.swagger.client.model.PopulationData;
import io.swagger.client.model.PopulationRequest;
import io.swagger.client.model.PopulationResponse;
import java.net.URL;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author katrinaeaton
 */
public class Population {
	
	private final String url = new String("http://localhost:8080");
//	public List<PopulationData> popList = new ArrayList<>();
//	ApiClient apiClient = new ApiClient();
//	private DefaultApi api;
//	private PopulationApi popApi;
	
	public Population()
	{
		try
		{
//			ApiClient apiClient = new ApiClient();
//			this.apiClient.setConnectTimeout(60000);
//			this.apiClient.setReadTimeout(60000);
//			this.apiClient.setWriteTimeout(60000);
//			this.apiClient.setBasePath(url);
//			DefaultApi api = new DefaultApi(apiClient);
//			popApi = new PopulationApi(apiClient);
			
//			PopulationResponse popResponse = popApi.getAllPopulations();
//			
//			this.popList = popResponse.getPopulationList();
//			System.out.println("popList: " + popList);
			
		} 
		catch (Exception ex) { System.out.println(ex); }
	}
	
	public List<PopulationData> getPopulationsFromDB()
	{
		ApiClient apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url);
		System.out.println("Api set");
//		DefaultApi api = new DefaultApi(apiClient);
		PopulationApi popApi = new PopulationApi(apiClient);
		System.out.println("popApi set");

		List<PopulationData> popList = new ArrayList<>();

		try 
		{ 
			PopulationResponse popResponse = popApi.getAllPopulations(); 
			System.out.println("opened popResponse");
			popList = popResponse.getPopulationList();
			System.out.println("retrieved populations");

			System.out.println("popList: " + popList);
		}
		catch (Exception ex) { System.out.println(ex); }
		
		return popList;
	}
	
	public List<String> getPopulationNames(List<PopulationData> populations)
	{
		List<String> popNames = new ArrayList<>();
		
		for (PopulationData populationName : populations) 
		{
			popNames.add(populationName.getName());
		}
		
		System.out.println("popNames: " + popNames);
		
		return popNames;
	}
	
	public PopulationData getPopulation(List<PopulationData> populations, String searchedPop)
	{
		PopulationData foundPopulation = new PopulationData();
		
		for (PopulationData populationName : populations) {
			if (populationName.getName().equals(searchedPop))
			{
				foundPopulation = populationName;
			}
		}
		
		return foundPopulation;
	}
	
	public void createNewPopulation(String popName, String popDesc)
	{
		ApiClient apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url);
		System.out.println("Api set");
//		DefaultApi api = new DefaultApi(apiClient);
		PopulationApi popApi = new PopulationApi(apiClient);
		System.out.println("popApi set");
		
		HFCurationRequest hfCurationRequest = new HFCurationRequest();
		PopulationRequest populationRequest = new PopulationRequest();

		populationRequest.setName(popName);
		populationRequest.setDescription(popDesc);

		System.out.println("Creating population: " + populationRequest.getName());

		try { popApi.createPopulation(populationRequest); }
		catch (Exception ex) { System.out.println(ex); }
	}
	
}

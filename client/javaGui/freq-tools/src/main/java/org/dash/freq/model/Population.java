/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.model;

import io.swagger.client.ApiClient;
import io.swagger.client.api.DefaultApi;
import io.swagger.client.api.PopulationApi;
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
	
	public Population()
	{
		
	}
	
	public List<String> getPopulations()
	{
		List<String> popNames = new ArrayList<>();
		
		try{
			ApiClient apiClient = new ApiClient();
			apiClient.setConnectTimeout(60000);
			apiClient.setReadTimeout(60000);
			apiClient.setWriteTimeout(60000);
			apiClient.setBasePath(url);
			DefaultApi api = new DefaultApi(apiClient);
			PopulationApi popApi = new PopulationApi(apiClient);
			
			PopulationResponse popResponse = popApi.getAllPopulations();
			
//			PopulationData populationData = 

			List<PopulationData> popList = popResponse.getPopulationList();
			System.out.println("popList: " + popList);

		
			for (PopulationData populationName : popList) {
				popNames.add(populationName.getName());
			}
		} catch (Exception ex) {System.out.println(ex);}
		
		System.out.println("popNames: " + popNames);
		return popNames;
	}
	
}

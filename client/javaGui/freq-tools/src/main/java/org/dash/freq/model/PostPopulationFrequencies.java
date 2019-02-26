/*

    Copyright (c) 2014-2019 National Marrow Donor Program (NMDP)

    This library is free software; you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 3 of the License, or (at
    your option) any later version.

    This library is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; with out even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
    License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this library;  if not, write to the Free Software Foundation,
    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

    > http://www.gnu.org/licenses/lgpl.html

*/
package org.dash.freq.model;

import org.dash.freq.controller.DataChecks;
import org.dash.freq.controller.HeaderProcessor;
import org.dash.freq.controller.LicenseType;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

import static org.dishevelled.compress.Readers.reader;

import java.awt.Color;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;
import java.util.concurrent.Callable;

import org.dishevelled.commandline.ArgumentList;
import org.dishevelled.commandline.CommandLine;
import org.dishevelled.commandline.CommandLineParseException;
import org.dishevelled.commandline.CommandLineParser;
import org.dishevelled.commandline.Switch;
import org.dishevelled.commandline.Usage;
import org.dishevelled.commandline.argument.FileArgument;
import org.dishevelled.commandline.argument.StringArgument;
import org.dishevelled.commandline.argument.URLArgument;

import io.swagger.client.api.CohortApi;
import io.swagger.client.ApiClient;
import io.swagger.client.ApiException;
import io.swagger.client.api.DefaultApi;
import io.swagger.client.api.PopulationApi;
import io.swagger.client.model.CohortData;
import io.swagger.client.model.CohortRequest;
import io.swagger.client.model.GenotypeList;
import io.swagger.client.model.HFCurationRequest;
import io.swagger.client.model.HFCurationResponse;
import io.swagger.client.model.HaplotypeFrequency;
import io.swagger.client.model.HaplotypeFrequencyData;
import io.swagger.client.model.Label;
import io.swagger.client.model.LabelData;
import io.swagger.client.model.License;
//import io.swagger.client.model.License.TypeOfLicenseEnum;
import io.swagger.client.model.PopulationData;
import io.swagger.client.model.PopulationRequest;


/**
 * PostPopulationFrequencies
 *
 */
public class PostPopulationFrequencies implements Callable<Integer> 
{

	private File inputFile;
	private final String gtRegistry;
	private final String estEntity;
	private final URL url;

	private static final String USAGE = "post-population-frequencies [args]";
	
	/**
	 * Post population frequencies to the frequency curation service
	 *
	 * @param inputFile
	 *            input file
	 * @param accessId
	 * @param cohortId
	 * @throws MalformedURLException
	 */
	public PostPopulationFrequencies(String gtRegistry, String estEntity, URL url) //File inputFile, 
			throws MalformedURLException {
//		this.inputFile = inputFile;
		this.gtRegistry = gtRegistry;
        this.estEntity = estEntity;
		if (url == null) {
			this.url = new URL("http://localhost:8080");
		} else {
			this.url = url;
		}
	}
	public void setFile(File incomingFile)
	{
		inputFile = incomingFile;
	}
	
	@Override
	public Integer call() throws Exception {
		
		// flags
		boolean headerFlag = false;
		boolean dataFlag = false;
		
		// data receptacles
		TreeMap<String, String> headers = new TreeMap<>();
		List<Integer> errorCodeList = new ArrayList<>();
		List<Integer> warningCodeList = new ArrayList<>();
		
		try 
		{
			// process the header
			HeaderProcessor hp = new HeaderProcessor();
			headers = hp.readHeader(reader(inputFile), errorCodeList);
			headerFlag = Boolean.valueOf(headers.get("flag"));
			System.out.println("Header flag: " + headerFlag);
			
			// check the data for consistancy
			DataChecks dataChecks = new DataChecks();
			dataFlag = dataChecks.populationDataCheck(reader(inputFile), errorCodeList, warningCodeList);
			System.out.println("Data flag: " + dataFlag);
			System.out.println("ErrorCodeList: " + errorCodeList);
			
			// if the header and data both check out, post the data
			if (headerFlag && dataFlag)
			{
				postPopulationFrequencies(reader(inputFile), headers);
				return 1;
			} 
			
		} catch (Exception ex) {
            System.out.println(ex);
			AppendText.appendToPane(PhycusGui.outputTextPane, ex.toString(), Color.RED);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
        }

		return 0;
	}

	public void postPopulationFrequencies(BufferedReader reader,
										TreeMap<String, String> headers) 
			throws IOException, ApiException {
		String row;
		String[] columns;

		HashMap<String, HaplotypeFrequencyData> populationMap = new HashMap<String, HaplotypeFrequencyData>();
		HaplotypeFrequencyData haplotypeFrequencyData;

		row = reader.readLine();
		String race = headers.get("pop");
		License license = LicenseType.typeOfLicense();
		System.out.println("Uploading license of type " + license);

		while ((row = reader.readLine()) != null) {
			columns = row.split(",");
			
			String haplotype = columns[0];
			Double frequency = new Double(columns[1]);

			if (populationMap.containsKey(race)) {
				haplotypeFrequencyData = populationMap.get(race);
			} else {
				haplotypeFrequencyData = new HaplotypeFrequencyData();
				haplotypeFrequencyData.setLicense(license);
			}
			
			HaplotypeFrequency hapFrequency = new HaplotypeFrequency();
			hapFrequency.setFrequency(new Double(frequency));
			hapFrequency.setHaplotypeString(haplotype);
			haplotypeFrequencyData.addHaplotypeFrequencyListItem(hapFrequency);

			populationMap.put(race, haplotypeFrequencyData);
		}

		reader.close();
		
		ApiClient apiClient = new ApiClient();
		apiClient.setConnectTimeout(60000);
		apiClient.setReadTimeout(60000);
		apiClient.setWriteTimeout(60000);
		apiClient.setBasePath(url.toString());
		DefaultApi api = new DefaultApi(apiClient);
		PopulationApi popApi = new PopulationApi(apiClient);
		CohortApi cohortApi = new CohortApi(apiClient);
		
		CohortRequest cohortRequest = new CohortRequest();
		
		CohortData cohortData = new CohortData();
		cohortData.setName(headers.get("cohort"));
		cohortData.setGenotypeList(new GenotypeList());
		
		cohortRequest.setCohortData(cohortData);
		
		System.out.println("Creating cohort: " + cohortData.getName());
		AppendText.appendToPane(PhycusGui.outputTextPane, "Creating cohort: " + cohortData.getName(), Color.BLACK);
		AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
		cohortData = cohortApi.createCohort(cohortRequest);
		
		LabelData labelData = new LabelData();
		Label registryLabel = new Label();
		registryLabel.setTypeOfLabel("GT_REGISTRY");
		registryLabel.setValue(gtRegistry);
		labelData.addLabelListItem(registryLabel);

		Label estimatorLabel = new Label();
		estimatorLabel.setTypeOfLabel("HT_ESTIMATION_ENT");
		estimatorLabel.setValue(estEntity);
		labelData.addLabelListItem(estimatorLabel);
		
		for (String populationName : populationMap.keySet()) {
			HFCurationRequest hfCurationRequest = new HFCurationRequest();
			PopulationRequest populationRequest = new PopulationRequest();
			
			populationRequest.setName(populationName);
			
			System.out.println("Creating population: " + populationRequest.getName());
			AppendText.appendToPane(PhycusGui.outputTextPane, "Creating population: " + populationRequest.getName(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);

			PopulationData populationData = popApi.createPopulation(populationRequest);
			
			hfCurationRequest.setPopulationID(populationData.getId());
			hfCurationRequest.setCohortID(cohortData.getId());
			hfCurationRequest.setHaplotypeFrequencyData(populationMap.get(populationName));

			hfCurationRequest.setLabelData(labelData);

			System.out.println("Submitting frequencies for population: " + populationData.getName());
			AppendText.appendToPane(PhycusGui.outputTextPane, "Submitting frequencies for population: " + populationData.getName(), Color.BLACK);
			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
		
			HFCurationResponse response = api.hfcPost(hfCurationRequest);
		}		
	}

	/**
	 * Main.
	 *
	 * @param args
	 *            command line args
	 * @throws MalformedURLException
	 */
//	public static void main(final String[] args) throws MalformedURLException {
//		Switch about = new Switch("a", "about", "display about message");
//		Switch help = new Switch("h", "help", "display help message");
//		FileArgument inputFile = new FileArgument("i", "input-file", "input file, default stdin", true);
//		StringArgument gtRegistry = new StringArgument("r", "registry", "genotype registry", false);
//		StringArgument estEntity = new StringArgument("e", "estimator", "haplotype frequency estimating entity", false);
//		URLArgument url = new URLArgument("u", "url", "frequency service url", false);
//
//		ArgumentList arguments = new ArgumentList(about, help, inputFile, gtRegistry, estEntity, url);
//		CommandLine commandLine = new CommandLine(args);
//
//		PostPopulationFrequencies postPopulationFrequencies = null;
//		try {
//			CommandLineParser.parse(commandLine, arguments);
//			if (about.wasFound()) {
//				About.about(System.out);
//				System.exit(0);
//			}
//			if (help.wasFound()) {
//				Usage.usage(USAGE, null, commandLine, arguments, System.out);
//				System.exit(0);
//			}
//			postPopulationFrequencies = new PostPopulationFrequencies(inputFile.getValue(), gtRegistry.getValue(),
//					estEntity.getValue(), url.getValue());
//		} catch (CommandLineParseException | IllegalArgumentException e) {
//			Usage.usage(USAGE, e, commandLine, arguments, System.err);
//			System.exit(-1);
//		}
//		try {
//			System.exit(postPopulationFrequencies.call());
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.exit(1);
//		}
//	}

}

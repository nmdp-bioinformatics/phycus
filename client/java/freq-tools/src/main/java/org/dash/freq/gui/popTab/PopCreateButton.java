package org.dash.freq.gui.popTab;

import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Frame;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JTextPane;

import org.dash.freq.exceptions.*;
import org.dash.freq.uploadData.Population;
import org.dash.freq.utilities.AppendText;
import org.dash.freq.utilities.FindParentFrame;

import io.swagger.client.model.PopulationData;

public class PopCreateButton {
	
	private JButton popCreationButton = new JButton("Create");

	private PopTabClassInstantiations popTabClassInstantiations = PopTabClassInstantiations.getPopTabClassInstantiationsInstance();
	
	private JTextPane popResultsTextPane = popTabClassInstantiations.getPopResultsTextPaneInstance();
	private JTextPane popNotificationsTextPane = popTabClassInstantiations.getPopNotificationsTextPaneInstance();
	private UpdatePopulationList updatePopulationList = popTabClassInstantiations.getUpdatePopulationListInstance();

	private PopSearchTextField popSearchTextFieldClass = popTabClassInstantiations.getPopSearchTextFieldClassInstance();
	private JTextField popSearchTextField = popTabClassInstantiations.getPopSearchTextFieldInstance();

	private Population populationClass = popTabClassInstantiations.getPopulationClassInstance();
	private List<PopulationData> filteredPopulationsData = new ArrayList();
	private List<PopulationData> populationsData = new ArrayList();

	// find the parent frame so the JOptionPanes have a reference to instantiate on
	private Frame parentFrame = FindParentFrame.getParentFrame(popCreationButton);

	public PopCreateButton() { }

	public JButton getPopCreateButton() {

		popCreationButton.setPreferredSize(new Dimension(90, 30));
		popCreationButton.addActionListener(popCreationListener);

		// add the action listener to the Search textfield so pressing enter submits
		// the text in the textfield as the new Population name
		popSearchTextField.addActionListener(popCreationListener);

		return popCreationButton;
	}

	private ActionListener popCreationListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {

			System.out.println("PopCreateButton activated");
			String popSearchName = popSearchTextField.getText();
			String popSearchDescription = "";
			boolean popFlag = true;

			
			
			// get the current population list
			populationsData = updatePopulationList.getDownloadedPopulationsData();

			// get the names of those populations
			List<String> popNames = populationClass.getPopulationNames(populationsData);
			System.out.println("pop Name: " + popSearchName);
			
			// does this name already exist?		
			if (popNames.contains(popSearchName.toUpperCase())) {
				popFlag = false;
				
				nameAlreadyExists(popSearchName);
			}
			
			// is the name blank?
			else if (popSearchName == null || popSearchName.equals("")) {
				popFlag = false;
				nameFieldIsEmpty();
			}
			
			// if name does not exist ask for a description
			else {

				// popup for description
				popSearchDescription = JOptionPane.showInputDialog(parentFrame, "Please enter a brief description of your population:");
				
				try{
					// if description is empty
					if(popSearchDescription.equals("")) {
						popFlag = false;
						
						descriptionFieldIsEmpty();
					}
				} catch(NullPointerException npe) {

					// most likely means the user clicked cancel on the description popup.
					// we don't want a second popup for clicking cancel, that'd just be annoying.
					// this will default to posting an error message to the notification textpane.
					popFlag = false;
				} catch(Exception ex) { 
					System.out.println("PopCreateButton: error getting data from the description popup: " + ex);
				}
			}

			System.out.println("pop Desc: " + popSearchDescription);

			// upload pop name / description
			if (popFlag) {
				try { 
					// create new population in db
					populationClass.createNewPopulation(popSearchName.toUpperCase(), popSearchDescription);

					// clear search bar
					// popSearchTextField.setText(null);

				} catch (Exception ex) {

					System.out.println(ex);
					popFlag = false;
					
					JOptionPane.showMessageDialog(parentFrame,
						("The population was not created\n" + ex),
						"Houston, we have a problem",
						JOptionPane.ERROR_MESSAGE);
				}

				// if the population was successfully created
				if (popFlag) {

					// notify that new pop has been created
					AppendText.appendToPane(popNotificationsTextPane, ("Population " + popSearchName.toUpperCase() + " created."), Color.BLACK);
					AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
					
					System.out.println("Resetting the pop search textfield.");
					popSearchTextFieldClass.clearTextField();
					// popResultsTextPane.setText("");
					

					// redownload the pop list (including new pop)
					updatePopulationList.downloadAllPopulations();

					
				}
			} else {
				// notify that new pop has not been created
				AppendText.appendToPane(popNotificationsTextPane, ("No population created."), Color.BLACK);
				AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
			}
		}
	};

	private void nameAlreadyExists(String popSearchName) {

		AppendText.appendToPane(popNotificationsTextPane, "The population name already exists", Color.RED);
		AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
		
		JOptionPane.showMessageDialog(parentFrame,
			("The population " + popSearchName.toUpperCase() + " already exists"),
			"This population already exists",
			JOptionPane.ERROR_MESSAGE);
	}

	private void nameFieldIsEmpty() {
		AppendText.appendToPane(popNotificationsTextPane, "The population name cannot be blank", Color.RED);
		AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);
			
		JOptionPane.showMessageDialog(parentFrame,
			("The population name cannot be blank"),
			 "Houston, we have a problem",
			 JOptionPane.ERROR_MESSAGE);
	}

	private void descriptionFieldIsEmpty() {
		AppendText.appendToPane(popNotificationsTextPane, "The population description cannot be blank", Color.RED);
		AppendText.appendToPane(popNotificationsTextPane, System.lineSeparator(), Color.BLACK);

		JOptionPane.showMessageDialog(parentFrame,
			("The population description cannot be blank"),
			 "Houston, we have a problem",
			 JOptionPane.ERROR_MESSAGE);
	}
}
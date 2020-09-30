package org.dash.freq.gui.popTab;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JTextField;

public class PopSearchTextField { //implements KeyListener {

	private JTextField popSearchTextField = new JTextField();
	private UpdatePopulationList updatePopulationList; // = new UpdatePopulationList();

	public PopSearchTextField(UpdatePopulationList updatePopList) {
		this.updatePopulationList = updatePopList;
	}

	public JTextField getPopSearchTextField() {
		popSearchTextField.setFocusable(true);
		popSearchTextField.setColumns(30);
		// popSearchTextField.addActionListener(popSearchTextFieldListener);
		// popSearchTextField.addKeyListener(popSearchTextFieldKeyListener());

		popSearchTextField.addKeyListener(new KeyAdapter() {
		    public void keyReleased(KeyEvent evt) {
		        popSearchTextFieldKeyReleased(evt);
		    }
		});

		return popSearchTextField;
	}

	// The PopCreateButton class also adds its listener to the textField
	// so pressing enter while focused on the textField functions like
	// clicking the create button. This code is located in the PopCreateButton class.

	// public void keyReleased(KeyEvent evt) {											   
	// 	String popSearchName = popSearchTextField.getText();
	// 	updatePopulationList.updatePopulationsDisplayed(popSearchName);
	// 	System.out.println("Key released: " + popSearchName);
		
	// }

	// public void keyPressed(KeyEvent evt) { }  
  
	// public void keyTyped(KeyEvent evt) {
	// }

	// private ActionListener popSearchTextFieldListener = new ActionListener() {
	// 	@Override
	// 	public void actionPerformed(ActionEvent evt) {
	// 	String popSearchName = popSearchTextField.getText();
	// 	updatePopulationList.updatePopulationsDisplayed(popSearchName);
	// 	System.out.println("Key released: " + popSearchName);
	// 	}
	// };

	// private void popSearchTextFieldKeyListener(ActionEvent evt) {                                                   
	// 	String popSearchName = popSearchTextField.getText();
	// 	updatePopulationList.updatePopulationsDisplayed(popSearchName);	
	// 	System.out.println("Key released: " + popSearchName);
	// }

	private void popSearchTextFieldKeyReleased(KeyEvent evt) {                                               
        String popSearchName = popSearchTextField.getText();
		updatePopulationList.updatePopulationsDisplayed(popSearchName);	
		System.out.println("Key released: " + popSearchName);
    }

	public void clearTextField() {
		// popSearchTextField.removeActionListener(popSearchTextFieldListener);
		popSearchTextField.setText("");

		// popSearchTextField.addActionListener(popSearchTextFieldListener);

	}
}
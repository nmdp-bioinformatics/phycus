// package org.dash.freq.gui.optionsTab.updateIon;

// import javax.swing.JOptionPane;
// import javax.swing.JDialog;
// import javax.swing.JPanel;
// import javax.swing.JTextField;
// import javax.swing.UIManager;
// import java.beans.*; //property change stuff
// import java.awt.*;
// import java.awt.event.*;

// import org.dash.freq.gui.optionsTab.OptionsTabClassInstantiations;
// import org.dash.freq.gui.uploadTab.IonPanel;
// import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
// import org.dash.freq.utilities.Prefs;
// import org.dash.freq.validations.IonCheck;

// public class UpdateDatabasePopup extends JDialog
// 				   implements ActionListener,
// 							  PropertyChangeListener {
// 	private String typedText = null;
// 	private JTextField textField;

// 	private JPanel optionsIonPanel;
// 	private OptionsIonPanel optionsIonPanelClass;

// 	private JOptionPane optionPane;

// 	private String btnString1 = "Submit";
// 	private String btnString2 = "Cancel";

// 	private IonCheck ionCheck = new IonCheck();
// 	private UploadTabClassInstantiations uploadTabClassInstantiations = UploadTabClassInstantiations.getUploadTabClassInstantiationsInstance();
// 	private IonPanel uploadTabIonPanel = uploadTabClassInstantiations.getIonPanelInstance();
// 	private OptionsTabClassInstantiations optionsTabClassInstantiations = OptionsTabClassInstantiations.getOptionsTabClassInstantiationsInstance();
// 	private OptionsIonPanel optionsTabIonPanel = optionsTabClassInstantiations.getOptionsIonPanelInstance();

// 	/** Creates the reusable dialog. */
// 	public UpdateDatabasePopup(Frame aFrame, JPanel parent) {
// 		super(aFrame, true);
// 		optionsIonPanel = parent;
// 		// optionsIonPanelClass = optionsIonPC;
// 		// parent.setPreferredSize(new Dimension(500, 300));
// 		// UIManager.put("optionPane.minimumSize",new Dimension(300,500));

// 		setTitle("Enter ION");

// 		textField = new JTextField();
// 		textField.setColumns(10);

// 		//Create an array of the text and components to be displayed.
// 		String msgString1 = "Please enter the Issuing Organization Number (ION)";
// 		String msgString2 = "of the group performing the genotyping:";
// 		// String msgString3 = "(This can be changed in the options tab)";
// 		Object[] popupInstructions = {msgString1, msgString2, textField};

// 		//Create an array specifying the number of dialog buttons
// 		//and their text.
// 		Object[] options = {btnString1, btnString2};


// 		//Create the JOptionPane.
// 		optionPane = new JOptionPane(popupInstructions,
// 									JOptionPane.QUESTION_MESSAGE,
// 									JOptionPane.YES_NO_OPTION,
// 									null,
// 									options,
// 									options[0]);

// 		//Make this dialog display it.
// 		setContentPane(optionPane);

// 		// this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
// 		this.setSize(new Dimension(450, 150));
// 		this.setLocationRelativeTo(null);


// 		//Handle window closing correctly.
// 		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
// 		addWindowListener(new WindowAdapter() {
// 			public void windowClosing(WindowEvent we) {
				
// 			// 	 * Instead of directly closing the window,
// 			// 	 * we're going to change the JOptionPane's
// 			// 	 * value property.
				 
// 				optionPane.setValue(new Integer(
// 									JOptionPane.CLOSED_OPTION));
// 			}
// 		});

// 		//Ensure the text field always gets the first focus.
// 		addComponentListener(new ComponentAdapter() {
// 			public void componentShown(ComponentEvent ce) {
// 				textField.requestFocusInWindow();
// 			}
// 		});

// 		//Register an event handler that puts the text into the option pane.
// 		textField.addActionListener(this);

// 		//Register an event handler that reacts to option pane state changes.
// 		optionPane.addPropertyChangeListener(this);
// 	}

// 	/** This method handles events for the text field. */
// 	public void actionPerformed(ActionEvent e) {
// 		optionPane.setValue(btnString1);
// 	}

// 	/** This method reacts to state changes in the option pane. */
// 	public void propertyChange(PropertyChangeEvent e) {
// 		String prop = e.getPropertyName();

// 		if (isVisible()
// 		 && (e.getSource() == optionPane)
// 		 && (JOptionPane.VALUE_PROPERTY.equals(prop) ||
// 			 JOptionPane.INPUT_VALUE_PROPERTY.equals(prop))) {
// 			Object value = optionPane.getValue();

// 			if (value == JOptionPane.UNINITIALIZED_VALUE) {
// 				//ignore reset
// 				return;
// 			}

// 			//Reset the JOptionPane's value.
// 			//If you don't do this, then if the user
// 			//presses the same button next time, no
// 			//property change event will be fired.
// 			optionPane.setValue(
// 					JOptionPane.UNINITIALIZED_VALUE);

// 			if (btnString1.equals(value)) {
// 				typedText = textField.getText();

// 				// ion check results
// 				String[] downloadIon = ionCheck.checkIon(typedText);

// 				// if the ion value has a value, save results to prefs 
// 				// update the labels, and we're done
// 				if(!downloadIon[0].equals("")) {

// 					Prefs.setIonNumber(downloadIon[0]);
// 					Prefs.setIonFacility(downloadIon[1]);
// 					uploadTabIonPanel.updateIonPanel();
// 					optionsTabIonPanel.updateOptionsTabIonPanel();

// 					clearAndHide();
				
// 				} else {
// 					//text was invalid
// 					textField.selectAll();
// 					JOptionPane.showMessageDialog(
// 									UpdateIonPopup.this,
// 									"Sorry, " + typedText + " "
// 									+ "isn't a valid ION.\n"
// 									+ "Please enter a valid ION.",
// 									"Try again",
// 									JOptionPane.ERROR_MESSAGE);
// 					typedText = null;
// 					textField.requestFocusInWindow();
// 				}
// 			} else { 
// 			    typedText = null;
// 			    clearAndHide();
// 			}
// 		}
// 	}

// 	/** This method clears the dialog and hides it. */
// 	public void clearAndHide() {
// 		ionCheck.close();
// 		textField.setText(null);
// 		setVisible(false);
// 	}
// }
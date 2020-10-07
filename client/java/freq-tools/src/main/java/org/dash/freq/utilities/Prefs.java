package org.dash.freq.utilities;

import java.util.prefs.Preferences;

/**
 * This class houses all the methods for setting and getting preferences.
 */
public class Prefs {

	private static final Preferences preferences = Preferences.userNodeForPackage(Prefs.class);

	private static final String DEFAULT_DOCS_PATH = (System.getProperty("user.home") 
				+ System.getProperty("file.separator") + "Documents"); 
	private static final String DEFAULT_DB_URL = "http://localhost:8080";



	public Prefs() { }

	/* for which tab is open in the GUI */

	/**
	 * Gets the id of what tab was last open. Used in Gui to determine which tab 
	 * should be open on start.
	 *
	 * @return The integer associated with the current tab.
	 */
	public static int getCurrentTab() {
		System.out.println("Get current tab: which tab are we storing? " 
							+ preferences.getInt("PHY_SELECTED_TAB", 0));
		return preferences.getInt("PHY_SELECTED_TAB", 0);
		
	}

	/**
	 * Sets the preference for what tab is currently selected. Used in Gui's ChangeListener.
	 *
	 * @param currentTab The integer associated with the currently open tab.
	 */
	public static void setCurrentTab(int currentTab) {
		preferences.putInt("PHY_SELECTED_TAB", currentTab);
		System.out.println("Set current tab: which tab is selected? " 
							+ preferences.getInt("PHY_SELECTED_TAB", 0));
	}

	/* for custom save paths */
	// most recent upload folder

	/**
	 * Returns the string of the path last used for uploading data. 
	 * Defaults to the user's Documents folder. Used to determine where 
	 * in the file system the UploadFileChooser should point at to upon opening.
	 */
	public static String getUploadPath() {
		String uploadPath = preferences.get("PHY_INPUT_DIR", DEFAULT_DOCS_PATH);
		return uploadPath;
	}

	/**
	 * Stores the string of the path last used for uploading data. 
	 * Defaults to the user's Documents folder. Used to determine where 
	 * in the file system should be stored by the SelectFileButton.
	 *
	 * @param newDocsPath The string of the upload path.
	 */
	public static void setUploadPath(String newDocsPath) {
		preferences.put("PHY_INPUT_DIR", newDocsPath);
	}

	// custom receipt folder

	/**
	 * Returns the string of the custom path used to store receipts for uploaded data. 
	 * This is only used if there is a custom location for receipts chosen, otherwise 
	 * the receipts are saved in the folder the data was uploaded from. Used in ReceiptPathTextArea 
	 * to display the custom path chosen, in SelectReceiptPathButton to set the currently open 
	 * folder in the custom receipt path file chooser, and when creating a receipt if 
	 * Prefs.isThereACustomReceiptPath() evaluates to true.
	 */
	public static String getCustomReceiptPath() {
		String receiptPath = preferences.get("PHY_RECEIPT_CUSTOM_FOLDER", DEFAULT_DOCS_PATH);
		return receiptPath;
	}

	/**
	 * Stores the string of the path used if the user chooses to use a custom receipt location. 
	 * Used in SelectReceiptPathButton. 
	 *
	 * @param newReceiptsPath The string of the custom receipts path.
	 */
	public static void setCustomReceiptPath(String newReceiptsPath) {
		preferences.put("PHY_RECEIPT_CUSTOM_FOLDER", newReceiptsPath);
		preferences.putBoolean("PHY_RECEIPT_CUSTOM", true);

		System.out.println("Set custom receipt path: Is there a custom receipt path? " 
							+ preferences.getBoolean("PHY_RECEIPT_CUSTOM", false));
	}

	/**
	 * Resets the custom receipt location by removing the custom receipt node. 
	 * Also updates Prefs.isThereACustomReceiptPath() to False. 
	 * Used in ResetReceiptPathButton.
	 */
	public static void resetCustomReceiptPath() {
		try {
			preferences.remove("PHY_RECEIPT_CUSTOM_FOLDER");
		} catch(Exception ex) { System.out.println("Error deleting the custom receipt node: " + ex); }

		preferences.putBoolean("PHY_RECEIPT_CUSTOM", false);
		System.out.println("Reset custom receipt path: Is there a custom receipt path? " 
							+ preferences.getBoolean("PHY_RECEIPT_CUSTOM", false));

	}

	// sanity check so program knows which path to use

	/**
	 * A sanity check so program knows which path to use for saving receipts. 
	 * Defaults to false so the program uses the folder the data was uploaded from. 
	 * Used by ReceiptPathTextArea to display where the receipts are stored.
	 * Also used to determine where to store receipts during the upload process.
	 *
	 * @return A boolean indicating if there is a custom receipt path.
	 */
	public static Boolean isThereACustomReceiptPath() {
		Boolean customReceipt = preferences.getBoolean("PHY_RECEIPT_CUSTOM", false);

		System.out.println("Is there a custom receipt path? " + customReceipt);
		return customReceipt;
	}

	/** for which licensing option index is selected */
	public static int getLicensingSelectedIndex() {
		int selectedLicensingIndex = preferences.getInt("PHY_LICENSE_INDEX", 0);
		return selectedLicensingIndex;
	}

	/**
	 * Stores the integer indicating which licensing option was selected. 
	 *
	 * @param selectedItemLocation The int indicating the selected option.
	 */
	public static void setLicensingSelectedIndex(int selectedItemLocation) {
		preferences.putInt("PHY_LICENSE_INDEX", selectedItemLocation);
	}

	/** for which licensing option string is selected */
	public static String getLicensingSelected() {
		String selectedLicense = preferences.get("PHY_LICENSE", "CC0");
		return selectedLicense;
	}
	
	/**
	 * Stores the string indicating which licensing option was selected. 
	 *
	 * @param selectedLicense The string of the selected option.
	 */
	public static void setLicensingSelected(String selectedLicense) {
		preferences.put("PHY_LICENSE", selectedLicense);
	}

	/** for what, if any, ION assigned to the facility */
	// ION facility number
	public static String getIonNumber() {
		String ionNumber = preferences.get("PHY_ION_NUMBER", "");
		return ionNumber;
	}

	public static void setIonNumber(String ionNumber) {
		preferences.put("PHY_ION_NUMBER", ionNumber);
		preferences.putBoolean("PHY_ION", true);
		System.out.println("Setting an ION: Is there an ION? (This should return true): " 
							+ preferences.getBoolean("PHY_ION", false));
	}

	// ION facility name
	public static String getIonFacility() {
		String ionNumber = preferences.get("PHY_ION_NAME", "");
		return ionNumber;
	}

	public static void setIonFacility(String ionName) {
		preferences.put("PHY_ION_NAME", ionName);
	}

	public static void resetIon() {
		try {
			preferences.remove("PHY_ION_NUMBER");
			preferences.remove("PHY_ION_NAME");
		} catch(Exception ex) { System.out.println("Error deleting the ION nodes: " + ex); }

		// update is there an ION
		preferences.putBoolean("PHY_ION", false);
		System.out.println("Reset ION: Is there an ION? (This should return false): " 
							+ preferences.getBoolean("PHY_ION", true));
	}

	/* for reporting options */
	public static Boolean getVerboseReportingSetting() {
		Boolean verboseReporting = preferences.getBoolean("PHY_VERBOSE_REPORTING", false);
		return verboseReporting;
	}

	public static void setVerboseReportingSetting(Boolean verboseReporting) {
		preferences.putBoolean("PHY_VERBOSE_REPORTING", verboseReporting);
		System.out.println("Verbose Reporting Setting: " + preferences.getBoolean("PHY_VERBOSE_REPORTING", false));
	}

	/* for advanced database settings */
	public static String getDatabaseUrl() {
		String databaseUrl = preferences.get("PHY_DB_URL", DEFAULT_DB_URL);
		return databaseUrl;
	}

	public static void setDatabaseUrl(String newDatabaseUrl) {
		preferences.put("PHY_DB_URL", newDatabaseUrl);
	}

	public static void resetDatabaseUrl() {
		try {
			preferences.remove("PHY_DB_URL");
		} catch(Exception ex) { System.out.println("Error deleting the custom DB URL node: " + ex); }
	}
}
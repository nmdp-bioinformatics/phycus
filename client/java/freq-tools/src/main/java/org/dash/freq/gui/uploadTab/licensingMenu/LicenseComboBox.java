package org.dash.freq.gui.uploadTab.licensingMenu;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JComboBox;

// import org.dash.freq.gui.uploadTab.UploadTabClassInstantiations;
import org.dash.freq.utilities.Prefs;


public class LicenseComboBox {

	private final String[] LICENSE_OPTIONS = { 
							"CC0 - No rights reserved",
							"BY - Attribution",
							"BY-SA - Attribution - ShareAlike",
							"BY-ND - Attribution - NoDerivatives",
							"BY-NC - Attribution - NonCommercial",
							"BY-NC-SA - Attribution - NonCommercial - ShareAlike",
							"BY-NC-ND - Attribution - NonCommercial - NoDerivatives" };

	private static final Map<Integer, String> LICENSE_STRING_CORRESPONDANCES = initiateLicenseStringHashMap();

	private static Map<Integer, String> initiateLicenseStringHashMap() {
		Map<Integer, String> licenseStringCorrenspondances = new HashMap<>();

		licenseStringCorrenspondances.put(0, "CC0");
		licenseStringCorrenspondances.put(1, "by");
		licenseStringCorrenspondances.put(2, "by-sa");
		licenseStringCorrenspondances.put(3, "by-nd");
		licenseStringCorrenspondances.put(4, "by-nc");
		licenseStringCorrenspondances.put(5, "by-nc-sa");
		licenseStringCorrenspondances.put(6, "by-nc-nd");

		return licenseStringCorrenspondances;
	}

	private JComboBox licenseComboBox = new JComboBox(LICENSE_OPTIONS);

	public LicenseComboBox() { }

	public JComboBox getLicenseComboBox() {

		licenseComboBox.setSelectedIndex(Prefs.getLicensingSelectedIndex());
		licenseComboBox.addActionListener(licenseComboBoxListener);

		return licenseComboBox;
	}

	public ActionListener licenseComboBoxListener = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent evt) {
			int licenseComboBoxSelection = licenseComboBox.getSelectedIndex();
			Prefs.setLicensingSelectedIndex(licenseComboBoxSelection);
			Prefs.setLicensingSelected(LICENSE_STRING_CORRESPONDANCES.get(licenseComboBoxSelection));
		}
	};

	public String getSelectedLicenseCode() {
		// JComboBox licenseComboBoxInstance = uploadTabClassInstantiations.getUploadLicenseComboBoxInstance();
		String licenseSelection = licenseComboBox.getSelectedItem().toString();
		String licenseCode = licenseSelection.split(" ")[0];

		System.out.println("Selected license code = " + licenseCode);

		return licenseCode;

	}
}

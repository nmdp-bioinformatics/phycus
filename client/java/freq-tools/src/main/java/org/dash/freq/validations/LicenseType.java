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
package org.dash.freq.validations;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.swagger.client.model.License;
import io.swagger.client.model.License.TypeOfLicenseEnum;

import org.dash.freq.gui.Gui;

public class LicenseType {
	public LicenseType() { }
	
// 	// get chosen license from GUI
// 	private String selectedLicense = parseLicense((String)PhycusGui
// 				.licenseComboBox.getSelectedItem());
	
// 	public License typeOfLicense(String license)
// 	{
// 		License newLicense = new License();
		
// 		switch (license) {
//             case "CC0":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.CC0);
// 				break;
//             case "BY":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY);
// 				break;
// 			case "BY_SA":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_SA);
// 				break;
// 			case "BY_ND":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_ND);
// 				break;
// 			case "BY_NC":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC);
// 				break;
// 			case "BY_NC_SA":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC_SA);
// 				break;
// 			case "BY_NC_ND":
// 				newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC_ND);
// 				break;
// 			default:
// 				System.out.println("Default case for LicenseType switch: This should not happen.");
// 		}
		
// 		System.out.println("License type: " + selectedLicense);

// 		return newLicense;
// 	}
	
// 	public License typeOfLicense()
// 	{
// 		License newLicense = typeOfLicense(selectedLicense);
		
// 		return newLicense;
// 	}	
	
// 	public static String parseLicense(String license)
// 	{
// 		// pattern to match
// 		String parsedLicense = new String();
// 		Pattern p = Pattern.compile("^(\\w+)");
// 		Matcher m = p.matcher(license);
		
// 		// if match is found
// 		if (m.find())
// 		{
// 			parsedLicense = m.group(1);
// 		}
		
// 		return parsedLicense;
// 	}
}

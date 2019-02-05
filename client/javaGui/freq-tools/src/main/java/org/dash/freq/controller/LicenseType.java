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
package org.dash.freq.controller;

import io.swagger.client.model.License;
import io.swagger.client.model.License.TypeOfLicenseEnum;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.dash.freq.view.PhycusGui;

public class LicenseType {
	public LicenseType()
	{
		
	}
	
	public static License typeOfLicense()
	{
		License newLicense = new License();
		String selectedLicense = parseLicense((String)PhycusGui
				.licenseComboBox
				.getSelectedItem());
		
		switch (selectedLicense) {
            case "CC0":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.CC0);
            System.out.println("License type: " + selectedLicense);
            break;
            case "BY":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY);
            System.out.println("License type: " + selectedLicense);
            break;
			case "BY_SA":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_SA);
            System.out.println("License type: " + selectedLicense);
            break;
			case "BY_ND":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_ND);
            System.out.println("License type: " + selectedLicense);
            break;
			case "BY_NC":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC);
            System.out.println("License type: " + selectedLicense);
            break;
			case "BY_NC_SA":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC_SA);
            System.out.println("License type: " + selectedLicense);
            break;
			case "BY_NC_ND":
            newLicense.setTypeOfLicense(TypeOfLicenseEnum.BY_NC_ND);
            System.out.println("License type: " + selectedLicense);
            break;
		}
		
		return newLicense;
	}
	
	public static String parseLicense(String license)
	{
		// pattern to match and string to check
		String parsedLicense = new String();
		Pattern p = Pattern.compile("^(\\w+)");
		Matcher m = p.matcher(license);
		
		// if match is found
		if (m.find())
		{
			parsedLicense = m.group(1);
		}
		
		return parsedLicense;
	}
}

/*

    Copyright (c) 2014-2015 National Marrow Donor Program (NMDP)

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

import java.awt.Color;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import org.dash.freq.view.AppendText;
import org.dash.freq.view.PhycusGui;

public class ErrorCodes {
	public ErrorCodes() {
	
	}

	static public TreeMap<Integer, String> ErrorList() {
		TreeMap<Integer, String> errorCodes = new TreeMap<Integer, String>();

		errorCodes.put(2, "Haplotype frequencies do not total 1.0000");
		errorCodes.put(3, "The values for the population column must be identical");
		errorCodes.put(4, "A population value must be included in the header. See help for more information.");
		errorCodes.put(5, "A cohort value must be included in the header. See help for more information.");
		errorCodes.put(6, "The cohort value must be fewer than 255 characters.");
		errorCodes.put(7, "A cohort value must be included in the header. See help for more information.");
		errorCodes.put(8, "");
		errorCodes.put(9, "");
		errorCodes.put(10, "");

		// errorCodes.put(, )
		
		return errorCodes;
	}
	
//	public static void printErrors(List<Integer> errorCodeList)
//	{
//		for (int x:errorCodeList)
//		{
//			System.out.println("* " + ErrorCodes.ErrorList().get(x));
//			AppendText.appendToPane(PhycusGui.outputTextPane, "* " + ErrorCodes.ErrorList().get(x), Color.RED);
//			AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
//			if (x == 2)
//			{
//				AppendText.appendToPane(PhycusGui.outputTextPane, ("  - Frequency totals: " + freqTotal), Color.RED);
//				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
//
//			}
//		}
//	}
}
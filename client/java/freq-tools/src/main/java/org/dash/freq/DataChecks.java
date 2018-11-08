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
package org.dash.freq;

import io.swagger.client.ApiException;
import io.swagger.client.model.HaplotypeFrequencyData;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class DataChecks {
	public DataChecks() {
        
    }
    
	public static List<Integer> raceCheck(String raceFirst, String race)
	{
		List<Integer> errorCodes = new ArrayList<>();
		boolean flag = true;
//		String first = raceArray.get(0);
//		if (first.getClass() != String.class)
//		{
//			errorCodes.add(4);
//			flag = false;
//		}
//		for(int i = 1; i < raceArray.size() && flag; i++)
//		{
			if (race != raceFirst)
			{
				flag = false;
				errorCodes.add(3);
				if (raceFirst.getClass() != String.class) errorCodes.add(4);
			}
//		}
		if (flag) System.out.println("ok");
		return errorCodes;
	}

	public void populationDataCheck(BufferedReader reader) throws IOException, ApiException 
	{
		String row;
		String[] columns;

		HashMap<String, HaplotypeFrequencyData> populationMap = new HashMap<String, HaplotypeFrequencyData>();
		HaplotypeFrequencyData haplotypeFrequencyData;

		// read through the file, consolodate the data for checking
		while ((row = reader.readLine()) != null) 
		{
			columns = row.split(",");

			String race = columns[0];
			String haplotype = columns[1];
			Double frequency = new Double(columns[2]);

			haplotypeFrequencyData = populationMap.get(race);
		}
	}
}

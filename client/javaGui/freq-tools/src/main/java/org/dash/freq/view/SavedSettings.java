/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import java.util.prefs.Preferences;

public class SavedSettings {
//	private Preferences prefs = Preferences.userNodeForPackage(org.dash.freq);
	
	private Preferences prefs;
	
	public void SavedSettings()
	{
		prefs = Preferences.userNodeForPackage(this.getClass());
	}
	
//	public void saveLastDirectory()
}

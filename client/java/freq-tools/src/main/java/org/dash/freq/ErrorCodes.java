/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq;

//import java.util.*;
import java.util.ArrayList;
import java.util.TreeMap;

/**
 *
 * @author kaeaton
 */
public class ErrorCodes {
    public ErrorCodes() {
        
    }
    
    /**
     *
     * @return
     */
    static public TreeMap<Integer, String> ErrorList() {
        TreeMap<Integer, String> errorCodes = new TreeMap<Integer, String>();
        
        errorCodes.put(2, "Haplotype frequencies do not total 1.0000");
        errorCodes.put(3, "The values for the \"race\" column must be identical");
        errorCodes.put(4, "The values for the \"race\" column must be strings");
        errorCodes.put(5, "");
        
        // errorCodes.put(, );
        
        
        return errorCodes;
    }
}

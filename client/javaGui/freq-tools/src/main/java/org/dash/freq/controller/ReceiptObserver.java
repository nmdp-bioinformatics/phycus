/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.controller;

import java.beans.PropertyChangeSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Observer;


/**
 *
 * @author kaeaton
 */
public class ReceiptObserver {
	private String lineForReceipt;
	private List<UploadReceipt> receipts = new ArrayList<>();
	
	public void addObserver(UploadReceipt receipt) 
	{
		this.receipts.add(receipt);
	}
	
	public void removeObserver(UploadReceipt receipt)
	{
		this.receipts.remove(receipt);
	}
	
	public void setLine(String line)
	{
		this.lineForReceipt = line;
		for (UploadReceipt uploadReceipt : this.receipts)
		{
			receipts.update(this.lineForReceipt);
		}
	}
}

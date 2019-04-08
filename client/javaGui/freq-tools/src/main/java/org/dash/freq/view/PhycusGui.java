/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dash.freq.view;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.event.ActionEvent;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.prefs.Preferences;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;


import org.dash.freq.controller.BatchUploader;
import org.dash.freq.model.PostPopulationFrequencies;

/**
 *
 * @author katrinaeaton
 */
public class PhycusGui extends javax.swing.JFrame {
	
	File selectedFile;
	private String gtRegistry;
	private String estEntity;
	public Preferences prefs = Preferences.userNodeForPackage(this.getClass());
	private URL url;
	private boolean folder = false;
	/**
	 * Creates new form PhycusGui
	 */
	public PhycusGui() {
		initComponents();
	}

	/**
	 * This method is called from within the constructor to initialize the form.
	 * WARNING: Do NOT modify this code. The content of this method is always
	 * regenerated by the Form Editor.
	 */
	@SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        fileChooserUpload = new javax.swing.JFileChooser(prefs.get("LAST_OUTPUT_DIR", (System.getProperty("user.home")+ System.getProperty("file.separator") + "Documents")));
        fileOrFolder = new javax.swing.ButtonGroup();
        EstEntityPopupFrame = new javax.swing.JFrame();
        EstEntityTextField = new javax.swing.JTextField();
        EstEntityEnterButton = new javax.swing.JButton();
        EstEntityCloseButton = new javax.swing.JButton();
        EstEntityInstructions1 = new javax.swing.JLabel();
        EstEntityInstructions2 = new javax.swing.JLabel();
        EstEntityInstructions3 = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        UploadFilesPanel = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        fileLocationTextArea = new javax.swing.JTextArea();
        uploadButton = new javax.swing.JButton();
        CsvNotificationLabel = new javax.swing.JLabel();
        SelectFilePanel = new javax.swing.JPanel();
        fileOpenButton = new javax.swing.JButton();
        jRBFile = new javax.swing.JRadioButton();
        jRBFolder = new javax.swing.JRadioButton();
        filler1 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 0), new java.awt.Dimension(0, 0), new java.awt.Dimension(32767, 32767));
        cancelButton = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        outputTextPane = new javax.swing.JTextPane();
        licenseComboBox = new javax.swing.JComboBox<>();
        licenseLabel = new javax.swing.JLabel();
        licenseHelpIcon = new javax.swing.JLabel();
        warningLabel = new javax.swing.JLabel();
        EstEntityLabel1 = new javax.swing.JLabel();
        EstEntityLabelCode = new javax.swing.JLabel();
        SettingsPanel = new javax.swing.JPanel();
        OptionsEstEntityLabel = new javax.swing.JLabel();
        OptionsEstEntityButton = new javax.swing.JButton();
        HelpPanel = new javax.swing.JPanel();
        jScrollPane5 = new javax.swing.JScrollPane();
        helpEditorPane = new javax.swing.JEditorPane();

        FileNameExtensionFilter filter = new FileNameExtensionFilter("Comma Separated Values file", "csv");
        fileChooserUpload.setFileFilter(filter);

        EstEntityPopupFrame.setVisible(false);
        EstEntityPopupFrame.setTitle("Genotyping Registry");
        EstEntityPopupFrame.setAlwaysOnTop(true);
        EstEntityPopupFrame.setLocationByPlatform(true);
        EstEntityPopupFrame.setMinimumSize(new java.awt.Dimension(300, 250));
        EstEntityPopupFrame.setName("EstEntityFrame"); // NOI18N

        EstEntityEnterButton.setText("Enter");
        EstEntityEnterButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EstEntityEnterButtonActionPerformed(evt);
            }
        });

        EstEntityCloseButton.setText("Close");
        EstEntityCloseButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EstEntityCloseButtonActionPerformed(evt);
            }
        });

        EstEntityInstructions1.setText("Please enter the ION or other facility identification ");

        EstEntityInstructions2.setText("of the group performing the genotyping:");

        EstEntityInstructions3.setText("(This can be changed in the options tab)");

        javax.swing.GroupLayout EstEntityPopupFrameLayout = new javax.swing.GroupLayout(EstEntityPopupFrame.getContentPane());
        EstEntityPopupFrame.getContentPane().setLayout(EstEntityPopupFrameLayout);
        EstEntityPopupFrameLayout.setHorizontalGroup(
            EstEntityPopupFrameLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(EstEntityPopupFrameLayout.createSequentialGroup()
                .addGroup(EstEntityPopupFrameLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(EstEntityPopupFrameLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(EstEntityPopupFrameLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(EstEntityInstructions1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(EstEntityInstructions2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(EstEntityInstructions3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(EstEntityPopupFrameLayout.createSequentialGroup()
                        .addGap(73, 73, 73)
                        .addComponent(EstEntityEnterButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(EstEntityCloseButton)))
                .addContainerGap(22, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, EstEntityPopupFrameLayout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(EstEntityTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 203, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(34, 34, 34))
        );
        EstEntityPopupFrameLayout.setVerticalGroup(
            EstEntityPopupFrameLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, EstEntityPopupFrameLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(EstEntityInstructions1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(EstEntityInstructions2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(EstEntityInstructions3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addComponent(EstEntityTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(EstEntityPopupFrameLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(EstEntityEnterButton)
                    .addComponent(EstEntityCloseButton))
                .addContainerGap())
        );

        EstEntityPopupFrame.getAccessibleContext().setAccessibleName("");
        // EstEntityPopupFrame.setVisible(false);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Phycus Upload Interface");
        setLocationByPlatform(true);
        setMaximumSize(new java.awt.Dimension(650, 600));

        jScrollPane1.setBackground(javax.swing.UIManager.getDefaults().getColor("Label.background"));
        jScrollPane1.setBorder(null);
        jScrollPane1.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        jScrollPane1.setFocusable(false);
        jScrollPane1.setOpaque(false);

        fileLocationTextArea.setEditable(false);
        fileLocationTextArea.setBackground(javax.swing.UIManager.getDefaults().getColor("Label.background"));
        fileLocationTextArea.setColumns(20);
        fileLocationTextArea.setLineWrap(true);
        fileLocationTextArea.setRows(5);
        fileLocationTextArea.setFocusable(false);
        fileLocationTextArea.setOpaque(false);
        jScrollPane1.setViewportView(fileLocationTextArea);

        uploadButton.setText("Upload");
        uploadButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                uploadButtonActionPerformed(evt);
            }
        });

        CsvNotificationLabel.setText("CSV files only.");

        SelectFilePanel.setLayout(new java.awt.GridBagLayout());

        fileOpenButton.setText("Select File");
        fileOpenButton.setMaximumSize(new java.awt.Dimension(100, 23));
        fileOpenButton.setMinimumSize(new java.awt.Dimension(100, 23));
        fileOpenButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                fileOpenButtonActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.gridwidth = 4;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(0, 0, 2, 0);
        SelectFilePanel.add(fileOpenButton, gridBagConstraints);

        fileOrFolder.add(jRBFile);
        jRBFile.setText("File");
        jRBFile.setName("file"); // NOI18N
        if (prefs.getBoolean("FILE_OR_FOLDER", true)){
            setFile();
            jRBFile.setSelected(true);
        } else {
            setFolder();
            jRBFolder.setSelected(true);
        }
        jRBFile.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRBFileActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(0, 23, 0, 0);
        SelectFilePanel.add(jRBFile, gridBagConstraints);

        fileOrFolder.add(jRBFolder);
        if (!prefs.getBoolean("FILE_OR_FOLDER", true)){
            jRBFolder.isSelected();
        }
        jRBFolder.setText("Folder");
        jRBFolder.setName("folder"); // NOI18N
        jRBFolder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRBFolderActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.gridwidth = 2;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(0, 23, 0, 0);
        SelectFilePanel.add(jRBFolder, gridBagConstraints);
        SelectFilePanel.add(filler1, new java.awt.GridBagConstraints());

        cancelButton.setText("Cancel");
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelButtonActionPerformed(evt);
            }
        });

        jScrollPane2.setViewportView(outputTextPane);

        licenseComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "CC0 - No rights reserved", "BY - Attribution", "BY_SA - Attribution - ShareAlike", "BY_ND - Attribution - NoDerivatives", "BY_NC - Attribution - NonCommercial", "BY_NC_SA - Attribution - NonCommercial - ShareAlike", "BY_NC_ND - Attribution - NonCommercial - NoDerivatives" }));
        licenseComboBox.setToolTipText("");
        licenseComboBox.setSelectedIndex(prefs.getInt("PHY_LICENSE", 0));
        licenseComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                licenseComboBoxActionPerformed(evt);
            }
        });

        licenseLabel.setText("Licensing type:");

        licenseHelpIcon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/37171Small.png"))); // NOI18N
        licenseHelpIcon.setLabelFor(licenseLabel);
        licenseHelpIcon.setToolTipText("A link to a description of the different licensing types");
        licenseHelpIcon.setAlignmentY(0.1F);
        licenseHelpIcon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                licenseHelpIconMouseClicked(evt);
            }
        });

        warningLabel.setText("Warnings will not prevent a file from being uploaded. Errors will.");

        EstEntityLabel1.setText("Haplotyping Group: ");

        try {if(prefs.nodeExists("/org/dash/freq/view/PHY_EST_ENTITY")){
            System.out.println(prefs.get("PHY_EST_ENTITY", "PHY_EST_ENTITY not found"));
            EstEntityLabelCode.setText(prefs.get("PHY_EST_ENTITY", "No code set"));
            if(EstEntityLabelCode.getText().equals("No code set")){EstEntityPopupFrame.setVisible(true);}
        } else {
            EstEntityPopupFrame.setVisible(true);
        }} catch (Exception ex){ System.out.println(ex);}

        javax.swing.GroupLayout UploadFilesPanelLayout = new javax.swing.GroupLayout(UploadFilesPanel);
        UploadFilesPanel.setLayout(UploadFilesPanelLayout);
        UploadFilesPanelLayout.setHorizontalGroup(
            UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                        .addGap(222, 222, 222)
                        .addComponent(uploadButton, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cancelButton, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                                .addGap(6, 6, 6)
                                .addComponent(EstEntityLabel1)
                                .addGap(4, 4, 4)
                                .addComponent(EstEntityLabelCode, javax.swing.GroupLayout.PREFERRED_SIZE, 324, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(licenseComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2)
                    .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                        .addComponent(SelectFilePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane1))
                    .addComponent(warningLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(CsvNotificationLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(UploadFilesPanelLayout.createSequentialGroup()
                                .addComponent(licenseLabel)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(licenseHelpIcon, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(445, 445, 445)))))
                .addContainerGap())
        );
        UploadFilesPanelLayout.setVerticalGroup(
            UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, UploadFilesPanelLayout.createSequentialGroup()
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jScrollPane1)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, UploadFilesPanelLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(SelectFilePanel, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(CsvNotificationLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(licenseLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(licenseHelpIcon, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(licenseComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(EstEntityLabel1)
                    .addComponent(EstEntityLabelCode, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 73, Short.MAX_VALUE)
                .addComponent(warningLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 199, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(15, 15, 15)
                .addGroup(UploadFilesPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(uploadButton))
                .addContainerGap())
        );

        jTabbedPane1.addTab("Upload Files", UploadFilesPanel);

        OptionsEstEntityLabel.setText("Reset Haplotyping Group ID:");

        OptionsEstEntityButton.setText("Reset");
        OptionsEstEntityButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                OptionsEstEntityButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout SettingsPanelLayout = new javax.swing.GroupLayout(SettingsPanel);
        SettingsPanel.setLayout(SettingsPanelLayout);
        SettingsPanelLayout.setHorizontalGroup(
            SettingsPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SettingsPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(OptionsEstEntityLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(OptionsEstEntityButton)
                .addContainerGap(310, Short.MAX_VALUE))
        );
        SettingsPanelLayout.setVerticalGroup(
            SettingsPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SettingsPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(SettingsPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(OptionsEstEntityLabel)
                    .addComponent(OptionsEstEntityButton))
                .addContainerGap(531, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Options", SettingsPanel);

        helpEditorPane.setEditable(false);
        helpEditorPane.setContentType("text/html"); // NOI18N
        helpEditorPane.setMaximumSize(new java.awt.Dimension(621, 572));
        helpEditorPane.addHyperlinkListener(new javax.swing.event.HyperlinkListener() {
            public void hyperlinkUpdate(javax.swing.event.HyperlinkEvent evt) {
                helpEditorPaneHyperlinkUpdate(evt);
            }
        });
        jScrollPane5.setViewportView(helpEditorPane);
        try { helpEditorPane.setText(Help.getHelpText()); }
        catch (Exception ex) { System.out.println(ex); }
        helpEditorPane.setCaretPosition(0);

        javax.swing.GroupLayout HelpPanelLayout = new javax.swing.GroupLayout(HelpPanel);
        HelpPanel.setLayout(HelpPanelLayout);
        HelpPanelLayout.setHorizontalGroup(
            HelpPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 579, Short.MAX_VALUE)
        );
        HelpPanelLayout.setVerticalGroup(
            HelpPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(HelpPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 572, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Help", HelpPanel);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 600, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.Alignment.TRAILING))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 593, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.Alignment.TRAILING))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void fileOpenButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_fileOpenButtonActionPerformed
        fileChooserUpload.setVisible(rootPaneCheckingEnabled);
        int returnValue = fileChooserUpload.showOpenDialog(null);
        if (returnValue == fileChooserUpload.APPROVE_OPTION)
        {
            selectedFile = fileChooserUpload.getSelectedFile();
            System.out.println(selectedFile.getName());
            String absolutePath = selectedFile.getAbsolutePath();
            fileLocationTextArea.setText( absolutePath );
			prefs.put("LAST_OUTPUT_DIR", absolutePath);
        }
    }//GEN-LAST:event_fileOpenButtonActionPerformed

    private void uploadButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_uploadButtonActionPerformed
        try
        {	
			if (!fileLocationTextArea.getText().isEmpty())
			{
				if (folder == false)
				{
					PostPopulationFrequencies ppf = new PostPopulationFrequencies(
							gtRegistry, 
							prefs.get("PHY_EST_ENTITY", null), //estEntity, 
							null);
					ppf.setFile(selectedFile);
					ppf.call();
				}
				else if (folder == true)
				{
					BatchUploader bu = new BatchUploader();
					bu.uploadFiles(selectedFile.toString());
				}
			}
			else 
			{
				AppendText.appendToPane(PhycusGui.outputTextPane, "Please select a file or folder", Color.RED);
				AppendText.appendToPane(PhycusGui.outputTextPane, System.lineSeparator(), Color.BLACK);
			}
        } catch (Exception e) {
            e.printStackTrace();
        }

    }//GEN-LAST:event_uploadButtonActionPerformed

    private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelButtonActionPerformed
        System.exit(0);
    }//GEN-LAST:event_cancelButtonActionPerformed

    private void jRBFileActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRBFileActionPerformed
		setFile();   // see below
    }//GEN-LAST:event_jRBFileActionPerformed

    private void jRBFolderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRBFolderActionPerformed
		setFolder(); // see below
    }//GEN-LAST:event_jRBFolderActionPerformed

    private void licenseHelpIconMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_licenseHelpIconMouseClicked
		try {
			URI licenseTypes = new URI("https://creativecommons.org/share-your-work/licensing-types-examples/");
			openWebpage(licenseTypes);
		} catch (Exception ex) {
            System.out.println(ex);
        }
    }//GEN-LAST:event_licenseHelpIconMouseClicked

    private void licenseComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_licenseComboBoxActionPerformed
		prefs.putInt("PHY_LICENSE", licenseComboBox.getSelectedIndex());
    }//GEN-LAST:event_licenseComboBoxActionPerformed

    private void EstEntityCloseButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EstEntityCloseButtonActionPerformed
        EstEntityPopupFrame.setVisible(false);
    }//GEN-LAST:event_EstEntityCloseButtonActionPerformed

    private void EstEntityEnterButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EstEntityEnterButtonActionPerformed
		prefs.put("PHY_EST_ENTITY", EstEntityTextField.getText());
		System.out.println(prefs.get("PHY_EST_ENTITY", "blank"));
		EstEntityLabelCode.setText(prefs.get("PHY_EST_ENTITY", "blank"));
		EstEntityPopupFrame.setVisible(false);
    }//GEN-LAST:event_EstEntityEnterButtonActionPerformed

    private void OptionsEstEntityButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_OptionsEstEntityButtonActionPerformed
        
		// what's there and where is it? Debugging info
		System.out.println(prefs.get("PHY_EST_ENTITY", "blank"));
		try { System.out.println(prefs.node("PHY_EST_ENTITY"));} catch (Exception ex){System.out.println(ex);}
		
		// show Est entity popup
		EstEntityPopupFrame.setVisible(true);
		
		// debugging info
		System.out.println(prefs.get("PHY_EST_ENTITY", "blank"));
    }//GEN-LAST:event_OptionsEstEntityButtonActionPerformed

    private void helpEditorPaneHyperlinkUpdate(javax.swing.event.HyperlinkEvent evt) {//GEN-FIRST:event_helpEditorPaneHyperlinkUpdate
        
		// the editor pane has to be told to respond to hyperlinks
		if(evt.getEventType() == javax.swing.event.HyperlinkEvent.EventType.ACTIVATED) {
			
			// get the descriptions in the link
			String desc = evt.getDescription();
			
			// find non-anchor urls
			if (desc == null || !desc.startsWith("#"))
			{
				try {
					// opens only this URL. Need to read the actual link to open others
					// Set this way because of time crunch
					URI licenseTypes = new URI("https://creativecommons.org/share-your-work/licensing-types-examples/");
					openWebpage(licenseTypes);
				} catch (Exception ex){System.out.println(ex);}
			}
			
			// select the first substring (ideally only substring), name
			desc = desc.substring(1);
			
			// got to the anchor
			helpEditorPane.scrollToReference(desc);
        }
    }//GEN-LAST:event_helpEditorPaneHyperlinkUpdate

	// open links to external browser
	public static void openWebpage(URI uri) {
		Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
		if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE)) {
			try {
				desktop.browse(uri);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// settings for uploading a file, used in custom code for jRBFile
	public void setFile() {
		// set file selection
		fileChooserUpload.setFileSelectionMode(JFileChooser.FILES_ONLY);
		
		// visual cues
		fileOpenButton.setText("Select File");
		CsvNotificationLabel.setText("CSV files only.");
		
		// save choice to preferences
		prefs.putBoolean("FILE_OR_FOLDER", true);
		
		// so uploader function knows whether it's a file or folder
		folder = false;
	}
	
	// settings for uploading a folder, used in custom code for jRBFile
	public void setFolder() {
		// set folder selection
		fileChooserUpload.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		
		// visual cues
		fileOpenButton.setText("Select Folder");
		CsvNotificationLabel.setText("Only CSV files will be processed, other files and subfolders will be ignored.");
		
		// save choice to preferences
		prefs.putBoolean("FILE_OR_FOLDER", false);
		
		// so uploader function knows whether it's a file or folder
		folder = true;
	}

	/**
	 * @param args the command line arguments
	 */
	public static void main(String args[]) {
		/* Set the Nimbus look and feel */
		//<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
		/* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
		 * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
		 */
		try {
			for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
				if ("Nimbus".equals(info.getName())) {
					javax.swing.UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (ClassNotFoundException ex) {
			java.util.logging.Logger.getLogger(PhycusGui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (InstantiationException ex) {
			java.util.logging.Logger.getLogger(PhycusGui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (IllegalAccessException ex) {
			java.util.logging.Logger.getLogger(PhycusGui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (javax.swing.UnsupportedLookAndFeelException ex) {
			java.util.logging.Logger.getLogger(PhycusGui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		}
		//</editor-fold>

		/* Create and display the form */
		java.awt.EventQueue.invokeLater(new Runnable() {
			public void run() {
				new PhycusGui().setVisible(true);
			}
		});
	}

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel CsvNotificationLabel;
    private javax.swing.JButton EstEntityCloseButton;
    private javax.swing.JButton EstEntityEnterButton;
    private javax.swing.JLabel EstEntityInstructions1;
    private javax.swing.JLabel EstEntityInstructions2;
    private javax.swing.JLabel EstEntityInstructions3;
    private javax.swing.JLabel EstEntityLabel1;
    private javax.swing.JLabel EstEntityLabelCode;
    private javax.swing.JFrame EstEntityPopupFrame;
    private javax.swing.JTextField EstEntityTextField;
    private javax.swing.JPanel HelpPanel;
    private javax.swing.JButton OptionsEstEntityButton;
    private javax.swing.JLabel OptionsEstEntityLabel;
    private javax.swing.JPanel SelectFilePanel;
    private javax.swing.JPanel SettingsPanel;
    private javax.swing.JPanel UploadFilesPanel;
    private javax.swing.JButton cancelButton;
    private javax.swing.JFileChooser fileChooserUpload;
    private javax.swing.JTextArea fileLocationTextArea;
    private javax.swing.JButton fileOpenButton;
    private javax.swing.ButtonGroup fileOrFolder;
    private javax.swing.Box.Filler filler1;
    private javax.swing.JEditorPane helpEditorPane;
    private javax.swing.JRadioButton jRBFile;
    private javax.swing.JRadioButton jRBFolder;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JTabbedPane jTabbedPane1;
    public static javax.swing.JComboBox<String> licenseComboBox;
    private javax.swing.JLabel licenseHelpIcon;
    private javax.swing.JLabel licenseLabel;
    public static javax.swing.JTextPane outputTextPane;
    private javax.swing.JButton uploadButton;
    private javax.swing.JLabel warningLabel;
    // End of variables declaration//GEN-END:variables
}

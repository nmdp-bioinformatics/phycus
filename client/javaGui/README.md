To run the software from terminal or a bash shell:
 - mvn install
 - cd freq-tools/target
 - unzip freq-tools-0.0.1-SNAPSHOT-bin.zip
 - cd freq-tools-0.0.1-SNAPSHOT/bin
 - open post-population-frequencies

 To run the software from Windows Powershell:
  - mvn install
  - cd freq-tools/target
  - Expand-Archive -Force freq-tools-0.0.1-SNAPSHOT-bin.zip
  - cd freq-tools-0.0.1-SNAPSHOT-bin/freq-tools-0.0.1-SNAPSHOT/bin
  - ./post-population-frequencies


 This multi-modual client requires both the freq-client and freq-tools folders to work. If you wish to move it, move the entire javaGui folder or the client will not have access to the API. (Single jar coming soon.)
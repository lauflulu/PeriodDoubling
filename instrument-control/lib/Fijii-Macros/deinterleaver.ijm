mainDir = getDirectory("Source Directory");
sourceDir = mainDir + "SinglePosSingleChan\\";


if (File.exists(sourceDir)) {
    setBatchMode(true);    
    list = getFileList(sourceDir);
	Dialog.create("Parameters");
	Dialog.addNumber("Number of Acquisition Windows", 3)
	Dialog.show();
	numAWs = Dialog.getNumber();
	for (j=0; j<numAWs; j++){
		File.makeDirectory(mainDir + "Acquisition_window_" + j+1);
	}

	
	for (i = 0; i < lengthOf(list); i++) {  
		open(sourceDir + list[i]);
		opts="how="+numAWs;
		run("Deinterleave", opts);
		for (j=0; j<numAWs; j++){
			winName=list[i] + " #" +j+1;
			selectWindow(list[i] + " #" +j+1);
			saveAs("tiff", mainDir + "Acquisition_window_" + j+1 +"\\" + list[i]);
		}
		run("Close All");
		showProgress(i, length(list));
    }
	
}
setBatchMode(false);}



mainDir = getDirectory("Source Directory");
//sourceDir = mainDir + "Acquisition_window_3\\";
sourceDir = mainDir + "SinglePosSingleChan\\";

if (File.exists(sourceDir)) {
    setBatchMode(false);    
    list = getFileList(sourceDir);
	Dialog.create("Parameters");
	Dialog.addNumber("Number of Positions", 8)
	Dialog.addNumber("Number of Channels", 4);
	Dialog.show();
	numPos = Dialog.getNumber();
	numChan = Dialog.getNumber();
	open(sourceDir + "Pos_1_Chan_1.tif");
	getDimensions(w, h, channels, frames, slices);
	run("Close All");
	run("Clear Results");
	for (pos = 1; pos < numPos+1; pos++) {  
		open(sourceDir + "Pos_" + pos +"_Chan_2.tif");
		columnHeader=getTitle();
		run("Subtract Background...", "rolling=200 stack");
		// user selects rectangle
		waitForUser("Select a rectangle!");
		getSelectionBounds(x1, y1, w1, h1);
		run("Crop");
		
		// then make a montage
		run("Make Montage...", "columns=1 rows="+frames+" scale=1 increment=1");
		run("Rotate 90 Degrees Left");
		// let user select channel
		waitForUser("Select a rectangle!");
		getSelectionBounds(x2, y2, w2, h2);
		run("Crop");
		// export time and intensity data
		run("Select All");
			// Get profile and display values in "Results" window
		profile = getProfile();
		for (i=0; i<profile.length; i++)
		  setResult(columnHeader, i, profile[i]);
		updateResults;
		run("Close All");
		
		// do the same for the other channels in the same position
		for (c = 3; c < numChan+1; c++) {
    		open(sourceDir + "Pos_" + pos +"_Chan_"+c+".tif");
			columnHeader=getTitle();
			run("Subtract Background...", "rolling=200 stack");
	    	// use same rectangle
			makeRectangle(x1, y1, w1, h1);
			run("Crop");
			
			// then make a montage
			run("Make Montage...", "columns=1 rows="+frames+" scale=1 increment=1");
			run("Rotate 90 Degrees Left");
			// use same rectangle
			makeRectangle(x2, y2, w2, h2);
			run("Crop");
			// export time and intensity data
			run("Select All");
				// Get profile and display values in "Results" window
			profile = getProfile();
			for (i=0; i<profile.length; i++)
			  setResult(columnHeader, i, profile[i]);
			updateResults;
			run("Close All");
		    }
		showProgress(pos, numPos);	
	}
	path = mainDir+"profile.csv";
	saveAs("Results", path);
	setBatchMode(false);
}




mainDir = getDirectory("Source Directory");
sourceDir = mainDir + "original\\";
File.makeDirectory(mainDir + "SinglePosSingleChan");

if (File.exists(sourceDir)) {
    setBatchMode(true);    
    list = getFileList(sourceDir);
	Dialog.create("Parameters");
	Dialog.addNumber("Number of Positions", 8)
	Dialog.addNumber("Number of Channels", 4);
	Dialog.show();
	numPos = Dialog.getNumber();
	numChan = Dialog.getNumber();
	frames = list.length; // 
	for (pos = 1; pos < numPos+1; pos++) {  
		open(sourceDir + list[0],c + pos*numChan + 1);

		// user selects rectangle
		waitForUser("Select a rectangle!");
		getSelectionBounds(x, y, width, height);







		
		run("Close All");

		
		
		
		for (c = 3; c < numChan+1; c++) {
    		open(sourceDir + list[0],c + pos*numChan + 1);
    	



		saveAs("tiff", mainDir + "SinglePosSingleChan\\Pos_" + pos + 1 + "_Chan_" + c+1 + ".tif");
		run("Close All");
    }
	showProgress(pos, numPos);
}
setBatchMode(false);}



run("Crop");
run("Subtract Background...", "rolling=200 stack");
// then make a montage
run("Make Montage...", "columns=1 rows=240 scale=1 increment=1");
run("Rotate 90 Degrees Left");
// let user select channel
makeRectangle(265, 273, 172, 39);
run("Crop");
// somehow export time and intensity data

// do the same for the other channels in the same position
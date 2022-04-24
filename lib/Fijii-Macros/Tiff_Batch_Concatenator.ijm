mainDir = getDirectory("Source Directory");
sourceDir = mainDir + "original\\";
File.makeDirectory(mainDir + "SinglePosSingleChan");

if (File.exists(sourceDir)) {
    setBatchMode(true);    
    list = getFileList(sourceDir);
	Dialog.create("Parameters");
	Dialog.addNumber("Number of Positions", 8)
	Dialog.addNumber("Number of Channels", 3);
	Dialog.show();
	numPos = Dialog.getNumber();
	numChan = Dialog.getNumber();
	frames = list.length; // 
	for (pos = 0; pos < numPos; pos++) {  
		for (c = 0; c < numChan; c++) {
    	open(sourceDir + list[0],c + pos*numChan + 1);
    	rename("tmp");
		for (t=1; t<frames; t++) {	 
			open(sourceDir + list[t], c + pos*numChan + 1);
			run("Concatenate...", "  title=tmp image1=tmp image2=" + list[t]);
		}
		saveAs("tiff", mainDir + "SinglePosSingleChan\\Pos_" + pos + 1 + "_Chan_" + c+1 + ".tif");
		run("Close All");
    }
	showProgress(pos, numPos);
}
setBatchMode(false);}


sourceDir = getDirectory("Source Directory");
//Dialog.create("Parameters");
//Dialog.addNumber("Number of Positions", 10)
//Dialog.addNumber("Number of Channels", 5);
//Dialog.show();
//pos = Dialog.getNumber();
//chan = Dialog.getNumber();

if (File.exists(sourceDir)) {
    setBatchMode(true);
    
    list = getFileList(sourceDir);
    open(sourceDir + list[0]);       
	rename("tmp");
        
	for (t=1; t<list.length; t++) {	 
		open(sourceDir + list[t]);
		run("Interleave", "stack_1=tmp stack_1=" + list[t]);
		close("tmp");
		close(list[t]);
		selectWindow("Combined Stacks");
		rename("tmp");
	    showProgress(t, list.length);
    }    
    
    setBatchMode(false);
	saveAs("tiff", sourceDir + "/Full.tif");
}


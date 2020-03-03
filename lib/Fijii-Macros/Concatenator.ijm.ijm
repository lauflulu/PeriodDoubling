sourceDir = getDirectory("Source Directory");
Dialog.create("Parameters");
Dialog.addNumber("Number of Positions", 9)
Dialog.addNumber("Number of Channels", 2);
Dialog.show();
pos = Dialog.getNumber();
chan = Dialog.getNumber();

if (File.exists(source_dir)) {
    setBatchMode(true);
    
    list = getFileList(sourceDir);
    for (i = 0; i < pos; i++) {
    	for (j = 0; j < chan;j++) {
    		for (k=0; k<list.length; k++) {
        if (endsWith(list[k], ".tif")) {
			img(i,j,k) = open(sourceDir + list[k], k+j+1);
			saveAs("tiff", sourceDir + "/Full.tif");
    	}
    }

        }        
	    showProgress(i, pos.length);
    }
}

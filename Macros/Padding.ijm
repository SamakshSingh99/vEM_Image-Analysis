inputDir = getDirectory("Choose Input Directory");
outputDir = getDirectory("Choose Output Directory");

targetW = 10000; //Set width
targetH = 10000; //Set height

list = getFileList(inputDir);

setBatchMode(true);

for (i = 0; i < list.length; i++) {

    open(inputDir + list[i]);

    w = getWidth();
    h = getHeight();

    run("Canvas Size...", 
        "width=" + targetW +
        " height=" + targetH +
        " position=Center zero");

    saveAs("Tiff", outputDir + list[i]);

    close();
}

setBatchMode(false);

print("Padding complete.");
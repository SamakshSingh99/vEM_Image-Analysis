inputDir = getDirectory("");
outputDir = getDirectory("");

list = getFileList(inputDir);
for (i = 0; i < list.length; i++) {
	open(inputDir + list[i]);
	makeRectangle(720, 384, 8484, 9756); //Can set your own dimensions
	run("Crop");
	saveAs("TIF", outputDir + list[i]);
	close();
}
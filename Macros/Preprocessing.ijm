# ImageJ Macro to Standardize vEM data

inputDir = getDirectory("/Users/samaksh/Desktop/NUS_Work/EMU/Anne Beghin - 20250213 - Dish C - vEM - Sample 1 - Montage Data");
outputDir = getDirectory("/Users/samaksh/Desktop/NUS_Work/EMU/Anne Beghin - 20250213 - Dish C - vEM - Sample 1 - Montage Data/cropped/");

list = getFileList(inputDir);
for (i = 0; i < list.length; i++) {
    open(inputDir + list[i]);
    makeRectangle(100, 50, 4000, 3000);  // Adjust cropping coordinates as needed
    run("Crop");
    saveAs("Jpeg", outputDir + list[i]); // Save in the chosen output folder
    close();
}

# Once Cropped Import the cropped images as sequence.

File.openSequence("/Users/samaksh/Desktop/NUS_Work/EMU/Anne Beghin - 20250213 - Dish C - vEM - Sample 1 - Montage Data/cropped/");

run("Duplicate...", "title=Denoised_Rrescaled duplicate");

run("Gaussian Blur...", "sigma=2 stack");

run("Orthogonal Views");
selectImage("YZ 1740");
selectImage("XZ 1612");
selectImage("YZ 1740");
selectImage("XZ 1612");

selectImage("Denoised_Rrescaled");

selectImage("YZ 1740");

close;

run("Properties...", "channels=1 slices=800 frames=1 
pixel_width=1.0000 pixel_height=1.0000 voxel_depth=3");

run("Orthogonal Views");
close;

run("Invert", "stack");

# Saving Files as Tiff sequence and AVI movie

saveAs("Tiff", "./Processed_Data/Denoised_Rrescaled.tif");

run("AVI... ", "compression=PNG frame=7 save=[./Processed_Data/Denoised_Rrescaled_Movie.avi]");

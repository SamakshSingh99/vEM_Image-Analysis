// Select folder
dir = getDirectory("Choose a Folder");

// Get list of files
list = getFileList(dir);

// Initialize variables
minWidth = 1e12;
minHeight = 1e12;
minWidthImage = "";
minHeightImage = "";

// Loop through files
for (i = 0; i < list.length; i++) {

    path = dir + list[i];
    
    // Skip if not a file
    if (!File.isFile(path))
        continue;

    // Try opening the image
    open(path);
    
    width = getWidth();
    height = getHeight();
    
    // Check smallest width
    if (width < minWidth) {
        minWidth = width;
        minWidthImage = list[i];
    }
    
    // Check smallest height
    if (height < minHeight) {
        minHeight = height;
        minHeightImage = list[i];
    }
    
    close(); // Close image to save memory
}

// Print results
print("Image with smallest width: " + minWidthImage + " (" + minWidth + " px)");
print("Image with smallest height: " + minHeightImage + " (" + minHeight + " px)");

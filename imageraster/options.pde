
// I/O settings
String sourceImageFilename = "f3.jpg";
String outputSvgFilename = "output.svg";

// background settings
color backgroundColorRed = 255;
color backgroundColorGreen = 255;
color backgroundColorBlue = 255;

// App settings
Boolean renderToScreen = true; // Display the result on screen? Can be problematic if source image is large
int renderStepsPerFrame = 200; // how many steps per frame if renderToScreen = true

// Define options for cells here


// PRESET
// rectangles


public CellOptions getCellOptions()
{
  CellOptions options = new CellOptions();
  
  // Set options for shapes in cells here:
  options.cellShape = new CellShapeText("FUNGI", "CircularStd-Book.otf", 32);
  options.cellShapeTransformer = new CellShapeTransformerFixed();
  options.cellShapeRotator = new CellShapeRotatorFixed();
  options.cellStyle = new CellStyleOnlyFill(new CellColorAverage());
  
  return options;
}


// Define options for raster here

public Raster getRaster(PImage sourceImage)
{
  Raster raster = new RasterDynamic(sourceImage, getCellOptions(), 5, 12, 1);
  
  return raster;
}

/*
public Raster getRaster(PImage sourceImage)
{
  Raster raster = new RasterFixed(sourceImage, getCellOptions(),
    10, // Cell Width
    10, // Cell height
    0, // X Spacing
    0 // Y Spacing
    );
  
  return raster;
}
*/

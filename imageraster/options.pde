
// I/O settings
String sourceImageFilename = "monalisa.jpg";
String outputSvgFilename = "output.svg";

// background settings
color backgroundColorRed = 255;
color backgroundColorGreen = 255;
color backgroundColorBlue = 255;

// App settings
Boolean renderToScreen = true; // Display the result on screen? Can be problematic if source image is large
int renderStepsPerFrame = 25; // how many steps per frame if renderToScreen = true

// Define options for cells here
public CellOptions getCellOptions()
{
  CellOptions options = new CellOptions();
  
  // Set options for shapes in cells here:
  options.cellShape = new CellShapeRectangle();
  options.cellShapeTransformer = new CellShapeTransformerDarkness();
  options.cellShapeRotator = new CellShapeRotatorFixed();
  options.cellStyle = new CellStyleOnlyFill(new CellColorFixed());
  
  return options;
}

// Define options for raster here
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

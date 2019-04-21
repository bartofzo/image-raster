import processing.svg.*;

PImage sourceImage;
Raster raster;

void settings() {
  
  sourceImage = loadImage(sourceImageFilename);

  if (renderToScreen)
  {
    size(sourceImage.width, sourceImage.height);
  }
  else
  {
    size(sourceImage.width, sourceImage.height, SVG, outputSvgFilename);
    noLoop();
  }
  
  
  
}

void setup()
{
  if (renderToScreen)
  {
    beginRecord(SVG, outputSvgFilename);
  }
  
  // Create our raster object
  raster = getRaster(sourceImage);
  
  // Set bg
  background(backgroundColorRed, backgroundColorGreen, backgroundColorBlue);
}

void draw() {
  
  if (renderToScreen) 
  {
    raster.steps(renderStepsPerFrame);
    if (raster.isFinished())
    {
     onFinished(); 
    }
  }
  else
  {
   
    // Do everything at once
    raster.processAll();
    onFinished();
    
  }

}

void onFinished()
{
  if (renderToScreen)
  {
    noLoop();
    endRecord();
  }
  
  println("Finished processing!");
}

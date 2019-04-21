public class CellSample
{
  public float avgBrightness; // in range 0-1
  public color avgColor;
  
  // Tells us where this sample was taken in the source image
  public float x;
  public float y;
  public float w;
  public float h;
}

public class Sampler {
 public CellSample getSample(PImage image, int x, int y, int width, int height)
 {
   float brightnessSum = 0;
   float rSum = 0;
   float gSum = 0;
   float bSum = 0;
   
   
   // Support overflow of the image if cellsize doesnt exactly match dimensions
   int maxX = min(x + width, image.width);
   int maxY = min(y + height, image.height);
   int pixelCount = (maxX - x) * (maxY - y);
   
   for (int x2 = x; x2 < x + width; x2++)
   {
    for (int y2 = y; y2 < y + height; y2++)
    {
      color c = image.get(x2,y2);
      brightnessSum += brightness(c);
      rSum += red(c);
      gSum += green(c);
      bSum += blue(c);
    }
   }
   
   CellSample sample = new CellSample();
   sample.avgBrightness = (brightnessSum / pixelCount) / 255;
   sample.avgColor = color(rSum / pixelCount, gSum / pixelCount, bSum / pixelCount);
   
   // copy over coordinates of sample
   sample.x = x;
   sample.y = y;
   sample.w = width;
   sample.h = height;
   return sample;
 }
 
}

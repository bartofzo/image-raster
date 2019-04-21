public abstract class Raster
{
  
  protected Sampler sampler;
  protected PImage sourceImage;
  protected CellOptions cellOptions;
  
  protected int x;
  protected int y;
  protected int w;
  protected int h;
  
  public abstract boolean isFinished();
  protected abstract void step();
  
  protected Raster(PImage sourceImage, CellOptions cellOptions)
  {
    this.sourceImage = sourceImage;
    this.w = sourceImage.width;
    this.h = sourceImage.height;
    this.cellOptions = cellOptions;
    this.sampler = new Sampler();
  }
  
  public void processAll()
  {
    while (!isFinished())
    {
     step(); 
    }
  }
  
  public void steps(int steps)
  {
   for (int i = 0; i < steps; i++)
   {
    if (!isFinished())
      step();
   }
  }
  
}


public class RasterFixed extends Raster {
   
  public int cellWidth;
  public int cellHeight;
  public int spacingX;
  public int spacingY;
  
   public RasterFixed(PImage sourceImage, CellOptions cellOptions, int cellWidth, int cellHeight, int spacingX, int spacingY)
   {
      super(sourceImage, cellOptions);
      this.cellWidth = cellWidth;
      this.cellHeight = cellHeight;
      this.spacingX = spacingX;
      this.spacingY = spacingY;
   }
   
   public RasterFixed(PImage sourceImage, CellOptions cellOptions)
   {
      super(sourceImage, cellOptions);
   }
  
  public boolean isFinished()
  {
    return x >= w && y >= h; 
  }

  protected void step()
  {
     CellSample sample = sampler.getSample(sourceImage, x, y, cellWidth, cellHeight);

     // Draw shape
     cellOptions.cellShape.draw(sample, cellOptions.cellStyle, cellOptions.cellShapeTransformer, cellOptions.cellShapeRotator);
     x += cellWidth + spacingX;
 
     // Move to next line
     if (x >= w)
     {
       y += cellHeight + spacingY;
       if (y < h)
         x = 0; // reset X only when we have more lines to process, otherwise we're finished
     }
  }
}

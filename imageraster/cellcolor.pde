public abstract class CellColor {
  public abstract color getColor(CellSample sample);
}

// CellColorBlack fills all shapes with just black
public class CellColorFixed extends CellColor {

  private float r;
  private float g;
  private float b;
  
  public CellColorFixed(float r, float g, float b)
  {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  public CellColorFixed()
  {
  }
  
  public color getColor(CellSample sample)
  {
   return color(r,g,b);
  }
  
}

// CellColorGrayscale fills all shapes with just grayscale value based on brightness
public class CellColorGrayScale extends CellColor {
  public color getColor(CellSample sample)
  {
   return color(sample.avgBrightness * 255); // brightness is a value between 0-1 so convert in byte range 
  }
}

// CellColorGrayscale fills all shapes with the average source color
public class CellColorAverage extends CellColor {
  public color getColor(CellSample sample)
  {
   return sample.avgColor; 
  }
}

// CellColorGrayscale fills all shapes with a random color
public class CellColorRandom extends CellColor {
  public color getColor(CellSample sample)
  {
   return color(random(255), random(255), random(255)); 
  }
}

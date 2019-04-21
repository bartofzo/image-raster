
public class RasterDynamic extends Raster {
   
  
  class Division
  {
   public boolean isSplit;
   
   public Division splitA;
   public Division splitB;
   public Division splitC;
   public Division splitD;
   
   // Use floats to prevent rounding errors
   public float x;
   public float y;
   public float w;
   public float h;

   public Division(float x, float y, float w, float h)
   {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
     
     //println("div: " + x + "," + y + " size: " + w + "x" + h);
   }
   
   public void split()
   {
     
     float halfWidth = ceil(w / 2);
     float halfHeight = ceil(h / 2);
     
    this.isSplit = true;
    this.splitA = new Division(x, y, halfWidth, halfHeight);
    this.splitB = new Division(x + halfWidth, y, halfWidth, halfHeight);
    this.splitC = new Division(x, y + halfHeight, halfWidth, halfHeight);
    this.splitD = new Division(x + halfWidth, y + halfHeight, halfWidth, halfHeight);
   }
   
   
   
   public void step()
   {
     
   }
  }
  
  public int cellWidthMin;
  public int cellHeightMin;
  
  public int cellWidthMax;
  public int cellHeightMax;
  
  public int spacingX;
  public int spacingY;
  

  private ArrayList<Division> leafs;
  private int currentStep;
  
   public RasterDynamic(PImage sourceImage, CellOptions cellOptions, int minDepth, int maxDepth, float fallOff)
   {
      super(sourceImage, cellOptions);
      
      Division root = new Division(0,0,w,h);
      leafs = new ArrayList<Division>();
      
      // always start with treshold zero to divide at least one time
      // after that we compare against average
      subDivide(root, 0, minDepth, maxDepth, 0, fallOff);
      println("Leaf count: " + leafs.size());
   }
   
  private void subDivide(Division root, int currentDepth, int minDepth, int maxDepth, float treshold, float fallOff)
  {
    
    
    CellSample sample = sampler.getSample(sourceImage, (int)root.x, (int)root.y, (int)root.w, (int)root.h);
    
    
    
    if (currentDepth < maxDepth && (sample.avgBrightness > treshold || currentDepth < minDepth))
    {
      
      currentDepth++;
      
      // exceeded treshold, split
      root.split();

      subDivide(root.splitA, currentDepth, minDepth, maxDepth, sample.avgBrightness * fallOff, fallOff);
      subDivide(root.splitB, currentDepth, minDepth, maxDepth, sample.avgBrightness * fallOff, fallOff);
      subDivide(root.splitC, currentDepth, minDepth, maxDepth, sample.avgBrightness * fallOff, fallOff);
      subDivide(root.splitD, currentDepth, minDepth, maxDepth, sample.avgBrightness * fallOff, fallOff);
    }
    else if (currentDepth < maxDepth)
    {
     // leaf, save it for iterating over later
     
     leafs.add(root);
    }
  }

  
  public boolean isFinished()
  {
    return currentStep >= leafs.size();
  }
  


  protected void step()
  {
     Division leaf = leafs.get(currentStep);
     CellSample sample = sampler.getSample(sourceImage, (int)leaf.x, (int)leaf.y, (int)leaf.w, (int)leaf.h);

     // Draw shape
     cellOptions.cellShape.draw(sample, cellOptions.cellStyle, cellOptions.cellShapeTransformer, cellOptions.cellShapeRotator);
     
     currentStep++;
  }
}

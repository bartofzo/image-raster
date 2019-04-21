public abstract class CellShapeRotator {
  public abstract float getRadians(CellSample sample);
}


// Rotates every cell with a fixed amount
public class CellShapeRotatorFixed extends CellShapeRotator {
  private float fixedRadians;
  public CellShapeRotatorFixed(float degrees)
  {
    fixedRadians = radians(degrees);
  }
  
  public CellShapeRotatorFixed()
  {
  }
  
  public float getRadians(CellSample sample)
  {
   return fixedRadians; 
  }
}

// Rotates every shape with an amount based on the average darkness value
public class CellShapeRotatorDarkness extends CellShapeRotator {
  
  private float bias;
  private float maxRadians;
  
  public CellShapeRotatorDarkness(float maxDegrees, float bias)
  {
    this.bias = bias;
    this.maxRadians = radians(maxDegrees);
  }
  
  public CellShapeRotatorDarkness(float maxDegrees)
  {
    this.bias = 1;
    this.maxRadians = radians(maxDegrees);
  }
  
  public CellShapeRotatorDarkness()
  {
    this.bias = 1;
    this.maxRadians = TWO_PI;
  }
  
  public float getRadians(CellSample sample)
  {
   return pow(1 - sample.avgBrightness, bias) * maxRadians;
  }
}

// Rotates every shape with an amount based on the average brightness value
public class CellShapeRotatorBrightness extends CellShapeRotator {
  
  private float bias;
  private float maxRadians;
  
  public CellShapeRotatorBrightness(float maxDegrees, float bias)
  {
    this.bias = bias;
    this.maxRadians = radians(maxDegrees);
  }
  
  public CellShapeRotatorBrightness(float maxDegrees)
  {
    this.bias = 1;
    this.maxRadians = radians(maxDegrees);
  }
  
  public CellShapeRotatorBrightness()
  {
    this.bias = 1;
    this.maxRadians = TWO_PI;
  }
  
  public float getRadians(CellSample sample)
  {
   return pow(sample.avgBrightness, bias) * maxRadians;
  }
}

// Rotates every shape with a random amound
public class CellShapeRotatorRandom extends CellShapeRotator {
  public CellShapeRotatorRandom()
  {
  }
  public float getRadians(CellSample sample)
  {
   return random(TWO_PI); 
  }
}

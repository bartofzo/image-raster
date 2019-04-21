public abstract class CellShapeTransformer {
  public abstract float getWidth(CellSample sample);
  public abstract float getHeight(CellSample sample);
  public abstract float getCenterX(CellSample sample);
  public abstract float getCenterY(CellSample sample);
}


// Sizes a shape according to darkness with an optional bias value
// the larger the bias, the more dark a sample has to be to produce a large shape
public class CellShapeTransformerDarkness extends CellShapeTransformer {
  private float bias;
 
  public CellShapeTransformerDarkness(float bias)
  {
   this.bias = bias; 
  }
  
  public CellShapeTransformerDarkness()
  {
   this.bias = 1; 
  }
  
  public float getWidth(CellSample sample)
  {
    return pow((1 - sample.avgBrightness), bias) * sample.w;
  }
  
  public float getHeight(CellSample sample)
  {
    return pow((1 - sample.avgBrightness), bias) * sample.h;
  }
  
  // Does nothing with position
  public float getCenterX(CellSample sample)
  {
    return sample.x + sample.w / 2;
  }
  
  // Does nothing with position
  public float getCenterY(CellSample sample)
  {
    return sample.y + sample.h / 2;
  }
}

// Sizes a shape according to brightness with an optional bias value
// the larger the bias, the more bright a sample has to be to produce a large shape
public class CellShapeTransformerBrightness extends CellShapeTransformer {
  private float bias;
 
  public CellShapeTransformerBrightness(float bias)
  {
   this.bias = bias; 
  }
  
  public CellShapeTransformerBrightness()
  {
   this.bias = 1; 
  }
  
  public float getWidth(CellSample sample)
  {
    return pow(sample.avgBrightness, bias) * sample.w;
  }
  
  public float getHeight(CellSample sample)
  {
    return pow(sample.avgBrightness, bias) * sample.h;
  }
  
  // Does nothing with position
  public float getCenterX(CellSample sample)
  {
    return sample.x + sample.w / 2;
  }
  
  // Does nothing with position
  public float getCenterY(CellSample sample)
  {
    return sample.y + sample.h / 2;
  }
}

// Returns same size as sample
public class CellShapeTransformerFixed extends CellShapeTransformer {
  public float getWidth(CellSample sample)
  {
    return sample.w;
  }
  
  public float getHeight(CellSample sample)
  {
    return sample.h;
  }
  
  // Does nothing with position
  public float getCenterX(CellSample sample)
  {
    return sample.x + sample.w / 2;
  }
  
  // Does nothing with position
  public float getCenterY(CellSample sample)
  {
    return sample.y + sample.h / 2;
  }
}

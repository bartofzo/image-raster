public abstract class CellShape {
  public void draw(CellSample sample, CellStyle style, CellShapeTransformer transformer, CellShapeRotator rotator)
  {
    
    // Sets translation and colorm, then calls drawshape to actually draw the shaper
    
    float x = transformer.getCenterX(sample);
    float y = transformer.getCenterY(sample);
    float w = transformer.getWidth(sample);
    float h = transformer.getHeight(sample);
  
    pushMatrix();
    translate(x,y);
    rotate(rotator.getRadians(sample));
    style.setStyle(sample);
    drawShape(w,h);
    popMatrix();
  }
  
  protected abstract void drawShape(float w, float h);
}

// Ellipse cannot rotate
public class CellShapeEllipse extends CellShape {
  protected void drawShape(float w, float h)
  {
    ellipseMode(CENTER);
    ellipse(0, 0, w, h);
  }
}

public class CellShapeRectangle extends CellShape {
  protected void drawShape(float w, float h)
  {
    rectMode(CENTER);
    rect(0,0,w,h);
  }
}

public class CellShapeTriangle extends CellShape {
  protected void drawShape(float w, float h)
  {
    triangle(-w / 2, -h / 2, w / 2, -h / 2, w / 2, h / 2);
  }
}

public class CellShapeLine extends CellShape {
  protected void drawShape(float w, float h)
  {
    line(-w / 2, 0, w / 2, 0);
  }
}

// Text as of yet will only scale uniformly
// so this works best with square cell sizes
public class CellShapeText extends CellShape {
  
  private String text;
  private int currentIndex;
  private PFont font;

  public CellShapeText(String text)
  {
    if (text.length() == 0)
      throw new Error("Text must have a length > 0");
    
    this.text = text;
    this.currentIndex = 0;
  }

  public CellShapeText(String text, String fontName, float pointSize)
  {
    if (text.length() == 0)
      throw new Error("Text must have a length > 0");
    
    this.text = text;
    this.currentIndex = 0;

    textFont(createFont(fontName, pointSize));
  }
  
  protected void drawShape(float w, float h)
  {
    textSize(min(w,h));
    text(text.charAt(currentIndex), 0,0);
    
    currentIndex++;
    if (currentIndex >= text.length())
      currentIndex = 0;
  }
}

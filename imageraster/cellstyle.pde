public abstract class CellStyle {
  public abstract void setStyle(CellSample sample);
}

public class CellStyleOnlyFill extends CellStyle
{
  
  private CellColor fillColorer;
 
  public CellStyleOnlyFill(CellColor fillColorer)
  {
    this.fillColorer = fillColorer;
  }
  
  public void setStyle(CellSample sample)
  {
   noStroke();
   fill(fillColorer.getColor(sample));
  }
}

public class CellStyleOnlyStroke extends CellStyle
{
  private CellColor strokeColorer;
  private float strokeWeight;
  
  public CellStyleOnlyStroke(CellColor strokeColorer)
  {
    this.strokeColorer = strokeColorer;
    this.strokeWeight = 1;
  }
  
  public CellStyleOnlyStroke(CellColor strokeColorer, float strokeWeight)
  {
    this.strokeColorer = strokeColorer;
    this.strokeWeight = strokeWeight;
  }
  
  public void setStyle(CellSample sample)
  {
   noFill();
   strokeWeight(strokeWeight);
   stroke(strokeColorer.getColor(sample));
  }
}

public class CellStyleBoth extends CellStyle
{
  private CellColor strokeColorer;
  private CellColor fillColorer;
  private float strokeWeight;
  
  public CellStyleBoth(CellColor fillColorer, CellColor strokeColorer, float strokeWeight)
  {
    this.fillColorer = fillColorer;
    this.strokeColorer = strokeColorer;
    this.strokeWeight = strokeWeight;
  }
  
  public CellStyleBoth(CellColor fillColorer, CellColor strokeColorer)
  {
    this.fillColorer = fillColorer;
    this.strokeColorer = strokeColorer;
    this.strokeWeight = 1;
  }
  
  public void setStyle(CellSample sample)
  {
   fill(fillColorer.getColor(sample));
   strokeWeight(strokeWeight);
   stroke(strokeColorer.getColor(sample));
  }
}

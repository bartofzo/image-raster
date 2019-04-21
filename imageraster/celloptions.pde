public class CellOptions
{
  public CellShape cellShape;
  public CellStyle cellStyle;
  public CellShapeRotator cellShapeRotator;
  public CellShapeTransformer cellShapeTransformer; 

  public CellOptions(
                   CellShape cellShape, 
                   CellShapeTransformer cellShapeTransformer, 
                   CellShapeRotator cellShapeRotator, 
                   CellStyle cellStyle)
   {
    this.cellShape = cellShape;
    this.cellShapeTransformer = cellShapeTransformer;
    this.cellShapeRotator = cellShapeRotator;
    this.cellStyle = cellStyle;
   }
   
   public CellOptions()
   {
   }
}

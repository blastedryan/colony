package
{
   public class tipObject
   {
       
      
      public var tipName:String;
      
      public var tipCostM:uint;
      
      public var tipCostP:uint;
      
      public var tipCostE:uint;
      
      public var tipDesc:String;
      
      public var tipCostI:uint;
      
      public function tipObject(b:String, c:uint, d:uint, e:uint, f:String, g:uint = 0)
      {
         super();
         tipName = b;
         tipCostM = c;
         tipCostP = d;
         tipCostE = e;
         tipDesc = f;
         tipCostI = g;
      }
   }
}

package
{
   public class aiOrder
   {
       
      
      public var limit:uint;
      
      public var array:Array;
      
      public var onHold:Boolean;
      
      public var tech:Boolean;
      
      public function aiOrder(w:uint, l:uint, t:Boolean = false)
      {
         super();
         limit = l;
         tech = t;
         onHold = false;
         array = new Array();
         array.push(w);
      }
   }
}

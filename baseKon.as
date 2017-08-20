package
{
   import flash.display.Sprite;
   
   public class baseKon extends gameKon
   {
       
      
      private var baseX:Array;
      
      private var baseY:Array;
      
      private var r:Number = 115;
      
      private var cF:Number = 0.625;
      
      public var BaseHolder:Sprite;
      
      public var BaseHolder2:Sprite;
      
      public function baseKon()
      {
         var i:* = undefined;
         var Base:* = null;
         baseX = new Array();
         baseY = new Array();
         BaseHolder = new Sprite();
         BaseHolder2 = new Sprite();
         super();
         baseX.push(0);
         baseX.push(r / 2);
         baseX.push(-r / 2);
         baseX.push(r);
         baseX.push(0);
         baseX.push(-r);
         baseX.push(r / 2);
         baseX.push(-r / 2);
         baseX.push(0);
         baseY.push(-r * cF);
         baseY.push(-r / 2 * cF);
         baseY.push(-r / 2 * cF);
         baseY.push(0);
         baseY.push(0);
         baseY.push(0);
         baseY.push(r / 2 * cF);
         baseY.push(r / 2 * cF);
         baseY.push(r * cF);
         for(i in baseX)
         {
            Base = new baseBuilding();
            Base.buildSide = false;
            BaseHolder.addChild(Base);
            Base.x = baseX[i];
            Base.y = baseY[i];
         }
         for(i in baseX)
         {
            Base = new baseBuilding();
            Base.buildSide = true;
            BaseHolder2.addChild(Base);
            Base.x = baseX[i];
            Base.y = baseY[i];
         }
      }
   }
}

package
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class _t
   {
      
      private static var last:uint = getTimer();
      
      private static var s:Stage;
      
      private static const C:Number = 33.3333333333333;
      
      public static var theFactor:Number = 1;
       
      
      public function _t()
      {
         super();
      }
      
      public static function init(ST:Stage) : void
      {
         s = ST;
      }
      
      public static function startTicker() : void
      {
         last = getTimer();
         s.addEventListener(Event.ENTER_FRAME,tick);
      }
      
      public static function stopTicker() : void
      {
         s.removeEventListener(Event.ENTER_FRAME,tick);
      }
      
      public static function tick(evt:Event) : void
      {
         var now:uint = getTimer();
         var factor:Number = (now - last) / C;
         theFactor = factor;
         if(theFactor > 2)
         {
            theFactor = 2;
         }
         last = now;
      }
   }
}

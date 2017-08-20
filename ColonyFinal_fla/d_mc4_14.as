package ColonyFinal_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public dynamic class d_mc4_14 extends MovieClip
   {
       
      
      public var inBut:SimpleButton;
      
      public var tDate:String;
      
      public var tSay:String;
      
      public function d_mc4_14()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function doFunction(me:MouseEvent) : void
      {
         toolTip.tip(new tipObject(tDate,0,0,0,tSay),0);
      }
      
      public function outFunction(me:MouseEvent) : void
      {
         toolTip.unTip();
      }
      
      function frame1() : *
      {
         inBut.addEventListener(MouseEvent.MOUSE_OVER,doFunction,false,0,true);
         inBut.addEventListener(MouseEvent.MOUSE_OUT,outFunction,false,0,true);
         tDate = "2185";
         tSay = "Athenia, the first extraterrestrial state in history, has been established.";
         inBut.useHandCursor = false;
      }
   }
}

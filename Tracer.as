package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public dynamic class Tracer extends MovieClip
   {
       
      
      public var tr:TextField;
      
      public var traBut:SimpleButton;
      
      public function Tracer()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function hideTra(e:MouseEvent) : void
      {
         if(!dataTracer.progressing)
         {
            dataTracer.hideTracer();
            dataTracer.theStage.dispatchEvent(new chatEvent("CLOSETRACER"));
         }
      }
      
      function frame1() : *
      {
         traBut.addEventListener(MouseEvent.CLICK,hideTra,false,0,true);
      }
   }
}

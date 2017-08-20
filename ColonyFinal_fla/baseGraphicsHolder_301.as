package ColonyFinal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class baseGraphicsHolder_301 extends MovieClip
   {
       
      
      public var bgi:MovieClip;
      
      public function baseGraphicsHolder_301()
      {
         super();
         addFrameScript(0,frame1,1,frame2,10,frame11,26,frame27,43,frame44);
      }
      
      function frame1() : *
      {
         visible = false;
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame11() : *
      {
         visible = true;
      }
      
      function frame27() : *
      {
         gotoAndStop("Built");
      }
      
      function frame44() : *
      {
         visible = false;
         gotoAndStop("Built");
      }
   }
}

package
{
   import flash.display.MovieClip;
   
   public dynamic class baseFrame extends MovieClip
   {
       
      
      public function baseFrame()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

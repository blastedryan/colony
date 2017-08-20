package ColonyFinal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class ag_intro_mc_160 extends MovieClip
   {
       
      
      public var main:Object;
      
      public function ag_intro_mc_160()
      {
         super();
         addFrameScript(0,frame1,217,frame218);
      }
      
      function frame1() : *
      {
         main.stop();
         gotoAndPlay(2);
      }
      
      function frame218() : *
      {
         main.play();
      }
   }
}

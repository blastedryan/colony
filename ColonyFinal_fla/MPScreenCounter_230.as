package ColonyFinal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class MPScreenCounter_230 extends MovieClip
   {
       
      
      public var basic:Object;
      
      public function MPScreenCounter_230()
      {
         super();
         addFrameScript(164,frame165);
      }
      
      function frame165() : *
      {
         basic.gotoAndStop("Game","GAME");
      }
   }
}

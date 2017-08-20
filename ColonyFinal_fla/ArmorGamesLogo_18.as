package ColonyFinal_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public dynamic class ArmorGamesLogo_18 extends MovieClip
   {
       
      
      public var b:SimpleButton;
      
      public function ArmorGamesLogo_18()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function getAGURL(me:MouseEvent) : void
      {
         var url:String = "http://ArmorGames.com";
         var req:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(req,"_blank");
         }
         catch(e:Error)
         {
         }
      }
      
      function frame1() : *
      {
         b.addEventListener(MouseEvent.CLICK,getAGURL);
      }
   }
}

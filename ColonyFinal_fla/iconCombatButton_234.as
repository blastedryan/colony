package ColonyFinal_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public dynamic class iconCombatButton_234 extends MovieClip
   {
       
      
      public var theIcon:MovieClip;
      
      public var theButton:SimpleButton;
      
      public var id:uint;
      
      public function iconCombatButton_234()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function doThing(e:MouseEvent) : void
      {
         gameKon.theRoot.uiCombatBut(id);
      }
      
      public function showTTui(e:MouseEvent) : void
      {
         gameKon.theRoot.combatUiTT(id);
      }
      
      public function hideTTui(e:MouseEvent) : void
      {
         toolTip.unTip();
      }
      
      function frame1() : *
      {
         theButton.addEventListener(MouseEvent.CLICK,doThing,false,0,true);
         theButton.addEventListener(MouseEvent.MOUSE_OVER,showTTui,false,0,true);
         theButton.addEventListener(MouseEvent.MOUSE_OUT,hideTTui,false,0,true);
      }
   }
}

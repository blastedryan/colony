package ColonyFinal_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public dynamic class uiButtonIcon_242 extends MovieClip
   {
       
      
      public var gfx:MovieClip;
      
      public var btn:SimpleButton;
      
      public var id:Number;
      
      public function uiButtonIcon_242()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function doOption(Event:MouseEvent) : void
      {
         doReal();
      }
      
      public function doReal() : void
      {
         var vars:* = null;
         var vars2:* = null;
         var hjy:* = undefined;
         var n:* = undefined;
         if(btn.visible)
         {
            if(gameKon.selectedBuilding != null)
            {
               vars = new Object();
               vars.auto = false;
               vars.cancelOrder = false;
               vars.pos = gameKon.theRoot.clientPlayer[1];
               vars.buildId = gameKon.selectedBuilding.INFO.options[id];
               vars.building = gameKon.selectedBuilding.baseId;
            }
            if(id == 8)
            {
               if(!gameKon.theRoot.singlePlayerMode)
               {
                  vars.cancelOrder = true;
                  vars2 = {};
                  vars2.body = vars;
                  vars2.option = null;
                  vars2.pos = vars.pos;
                  vars2.cmd = 0;
                  mpKon.sendOpt(vars2);
               }
               else
               {
                  gameKon.doOption(null,true,false,gameKon.playerNow,gameKon.selectedBuilding);
               }
            }
            else if(gameKon.selectedBuilding != null)
            {
               if(gameKon.shiftToggle)
               {
                  vars.auto = true;
                  gameKon.doOption(optionData.LIST[gameKon.selectedBuilding.INFO.options[id]],false,true,gameKon.playerNow,gameKon.selectedBuilding,false,false,vars,true);
               }
               else
               {
                  gameKon.doOption(optionData.LIST[gameKon.selectedBuilding.INFO.options[id]],false,false,gameKon.playerNow,gameKon.selectedBuilding,false,false,vars,true);
               }
            }
            else
            {
               for(hjy in gameKon.selectedUnit)
               {
                  if(gameKon.selectedUnit[hjy].rallyMode)
                  {
                     gameKon.selectedUnit[hjy].rallyMode = false;
                     gameKon.selectedUnit[hjy].aiPosition = false;
                  }
               }
               if(gameKon.theRoot.singlePlayerMode)
               {
                  gameKon.doUnitOption(id);
               }
               else
               {
                  vars = new Object();
                  vars.id = id;
                  vars.orderArray = new Array();
                  for(n in gameKon.selectedUnit)
                  {
                     vars.orderArray.push(gameKon.selectedUnit[n].unitId);
                  }
                  mpKon.sendOff(vars,true,"orderUnit");
               }
            }
         }
      }
      
      public function doTip(Event:MouseEvent) : void
      {
         if(toolTip.errorTip != true)
         {
            gameKon.doTip(id,true);
         }
      }
      
      public function unTip(Event:MouseEvent) : void
      {
         gameKon.doTip(0,false);
      }
      
      function frame1() : *
      {
         btn.addEventListener(MouseEvent.CLICK,doOption);
         btn.addEventListener(MouseEvent.MOUSE_OVER,doTip);
         btn.addEventListener(MouseEvent.MOUSE_OUT,unTip);
      }
   }
}

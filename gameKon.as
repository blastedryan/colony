package
{
   import flash.display.Stage;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class gameKon
   {
      
      private static var newTips:Array = new Array();
      
      public static var rallyOn:Boolean;
      
      public static var playerNow:playerKon;
      
      private static var incomeTimer:Timer;
      
      public static var displayArray:Array = new Array();
      
      public static var shiftToggle:Boolean = false;
      
      public static var cText2:tipObject;
      
      public static var tippingWork:Boolean = false;
      
      public static var desync:Boolean = false;
      
      public static var buildingArray:Array = new Array();
      
      public static var selectedBuilding:baseBuilding;
      
      public static var selectedUnit:Array;
      
      public static var winningTeam:uint;
      
      public static var theStage:Stage;
      
      public static var theRoot:Object;
      
      {
         newTips[0] = new tipObject("Advance",0,0,0,"Move forward and attack normally.");
         newTips[1] = new tipObject("Hold",0,0,0,"Hold position and fire at nearby enemies.");
         newTips[2] = new tipObject("Charge",0,0,0,"Storm towards the enemy base, attacking nothing else.");
         newTips[3] = new tipObject("Fall Back",0,0,0,"Retreat back towards base, but will not return enemy fire.");
      }
      
      private var incomeTime:Number = 5;
      
      public var player0:playerKon;
      
      public var player1:playerKon;
      
      public var player2:playerKon;
      
      public var player3:playerKon;
      
      public var player4:playerKon;
      
      public function gameKon()
      {
         super();
         displayArray = new Array();
         buildingArray = new Array();
         selectedBuilding = null;
         selectedUnit = null;
      }
      
      public static function unselectBuilding() : void
      {
         var i:* = undefined;
         selectedBuilding = null;
         for(i in buildingArray)
         {
            buildingArray[i].unselBase();
         }
      }
      
      public static function doTip(j:Number, action:Boolean) : void
      {
         var p:* = undefined;
         var d:* = undefined;
         if(action)
         {
            if(selectedBuilding != null)
            {
               p = selectedBuilding.INFO.options[j];
               if(p != null)
               {
                  d = optionData.LIST[p];
                  toolTip.tip(d.tip,0);
               }
            }
            else
            {
               toolTip.tip(newTips[j],0);
            }
         }
         else
         {
            toolTip.unTip();
         }
      }
      
      public static function doOption(param1:Object, param2:Boolean, param3:Boolean, param4:playerKon, param5:baseBuilding, param6:Boolean = false, param7:Boolean = false, param8:Object = null, param9:Boolean = false) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = undefined;
         if(param5 != null)
         {
            if(param2)
            {
               param1 = param5.option;
               if(!(!theRoot.singlePlayerMode && !param4.CPUMODE && param4 != playerNow && (param1.buildMissile != null || param1.buildUnits != null)))
               {
                  param4.addRes(0,param1[0]);
                  param4.addRes(1,param1[1]);
                  param4.addRes(2,param1[2]);
                  param4.addRes(3,param1[4]);
               }
               trace("CANCEL WORK");
               param5.cancelWork("[GameKon] Ordered to Cancel.");
               if(param1.buildMissile != null)
               {
                  param4.mcd++;
               }
            }
            else if(param6 || param4.r_m >= param1[0] && param4.r_p >= param1[1] && param4.r_e >= param1[2] && param4.r_i >= param1[4])
            {
               if(param6 || checkBuild(param4,param1.buildReq))
               {
                  if(param6 || checkTech(param4,param1.techReq))
                  {
                     if(param6 || checkStock(param4,param1.stockReq))
                     {
                        if(!theRoot.singlePlayerMode && param9 == true)
                        {
                           if(param3)
                           {
                              param8.auto = true;
                           }
                           _loc10_ = {};
                           _loc10_.body = param8;
                           _loc10_.option = param1.id;
                           _loc10_.pos = param4.POS;
                           _loc10_.cmd = 0;
                           mpKon.sendOpt(_loc10_);
                        }
                        if(!param9 || theRoot.singlePlayerMode)
                        {
                           if(!(!theRoot.singlePlayerMode && !param4.CPUMODE && param4 != playerNow && (param1.buildMissile != null || param1.buildUnits != null)))
                           {
                              param4.addRes(0,-param1[0]);
                              param4.addRes(1,-param1[1]);
                              param4.addRes(2,-param1[2]);
                              param4.addRes(3,-param1[4]);
                              param4.stock[param1.stockReq]--;
                           }
                           param5.option = param1;
                           _loc12_ = 0;
                           for(_loc13_ in param1.buildResource)
                           {
                              _loc12_ = uint(_loc12_ + param1.buildResource[_loc13_]);
                           }
                           _loc11_ = uint(param1[3]);
                           if(param4.race == 0)
                           {
                              if(_loc12_ == 0)
                              {
                                 _loc11_ = uint(_loc11_ * 0.65);
                                 if(_loc11_ > 4)
                                 {
                                    _loc11_ = 4;
                                 }
                                 if(_loc11_ < 1)
                                 {
                                    _loc11_ = 1;
                                 }
                              }
                           }
                           if(param4.race == 2)
                           {
                              if(_loc12_ > 0)
                              {
                                 _loc11_ = uint(_loc11_ * 0.85);
                              }
                           }
                           param5.maxTime = _loc11_ * 30;
                           param5.beginWork();
                           if(param3)
                           {
                              param5.autoBuild = true;
                           }
                        }
                     }
                     else if(!param7)
                     {
                        toolTip.giveError("Error","You don\'t have enough things in stock to do this.");
                     }
                  }
                  else if(!param7)
                  {
                     toolTip.giveError("Error","You don\'t have the required technology to do this.");
                  }
               }
               else if(!param7)
               {
                  toolTip.giveError("Error","You don\'t have the required structure to do this.");
               }
            }
            else if(!param7)
            {
               toolTip.giveError("Error","You don\'t have enough resources to do this.");
            }
         }
      }
      
      public static function checkStock(player:playerKon, tar:*) : *
      {
         if(player.stock[tar] > 0 || tar == null)
         {
            return true;
         }
         return false;
      }
      
      public static function checkTech(player:playerKon, tar:*) : *
      {
         if(player.tech[tar] > 0 || tar == null)
         {
            return true;
         }
         return false;
      }
      
      public static function doUnitOption(id:uint, unitArray:Array = null) : void
      {
         var k:* = undefined;
         var u:* = undefined;
         var scan_i:* = undefined;
         var f:* = undefined;
         var orderMatrix:Array = new Array();
         if(unitArray == null)
         {
            orderMatrix = selectedUnit;
         }
         else
         {
            for(u in unitArray)
            {
               for(scan_i in unitKon.masterUnitArray)
               {
                  if(unitKon.masterUnitArray[scan_i].unitId == unitArray[u])
                  {
                     orderMatrix.push(unitKon.masterUnitArray[scan_i]);
                  }
               }
            }
         }
         for(k in orderMatrix)
         {
            if(orderMatrix[k] == playerNow.team.all[0])
            {
               for(f in playerNow.team.all)
               {
                  if(f != 0)
                  {
                     playerNow.team.all[f].behave = id;
                     if(id == 1)
                     {
                        playerNow.team.all[f].modeChange(0);
                     }
                  }
               }
            }
            else
            {
               orderMatrix[k].behave = id;
               orderMatrix[k].modeChange(0);
            }
         }
      }
      
      public static function checkBuild(player:playerKon, tar:*) : *
      {
         var u:* = undefined;
         var c:Boolean = false;
         for(u in player.builds)
         {
            if(player.builds[u].currentBuilding == tar)
            {
               c = true;
            }
            if(tar == null)
            {
               c = true;
            }
         }
         return c;
      }
      
      public static function shakeScreen(a:uint) : void
      {
         if(a == 0)
         {
            theRoot.startShake(4,1.3,0.8);
         }
         if(a == 1)
         {
            theRoot.startShake(13,1.23,1.4);
         }
         if(a == 2)
         {
            theRoot.startShake(30,1.5,0.9);
         }
      }
      
      public function assignBase() : void
      {
         var i:* = undefined;
         unitKon.resetAll(player1,player3);
         buildingArray[5].ownBy = player1;
         buildingArray[6].ownBy = player1;
         buildingArray[7].ownBy = player1;
         buildingArray[8].ownBy = player1;
         buildingArray[0].ownBy = player2;
         buildingArray[1].ownBy = player2;
         buildingArray[2].ownBy = player2;
         buildingArray[3].ownBy = player2;
         buildingArray[14].ownBy = player3;
         buildingArray[15].ownBy = player3;
         buildingArray[16].ownBy = player3;
         buildingArray[17].ownBy = player3;
         buildingArray[9].ownBy = player4;
         buildingArray[10].ownBy = player4;
         buildingArray[11].ownBy = player4;
         buildingArray[12].ownBy = player4;
         for(buildingArray[i].baseId in buildingArray)
         {
            if(i == 4 || i == 13)
            {
               buildingArray[i].fixColor("White");
               buildingArray[i].ownBy = player0;
               buildingArray[i].option = optionData.LIST[1];
               buildingArray[i].maxTime = buildingArray[i].option[3] * 30;
               buildingArray[i].beginWork();
            }
            else
            {
               buildingArray[i].pushBuild();
               buildingArray[i].fixColor(theRoot.colorStrings[buildingArray[i].ownBy.cityColor]);
            }
         }
      }
      
      public function setData(importStage:Stage, importRoot:Object) : void
      {
         theStage = importStage;
         theRoot = importRoot;
         rallyOn = false;
         player0 = new playerKon();
         player1 = new playerKon();
         player2 = new playerKon();
         player3 = new playerKon();
         player4 = new playerKon();
         playerNow = new playerKon();
      }
      
      public function runData() : void
      {
         incomeTimer = new Timer(5000);
         incomeTimer.start();
         incomeTimer.addEventListener(TimerEvent.TIMER,Run,false,0,true);
      }
      
      public function stopData() : void
      {
         incomeTimer.stop();
         incomeTimer.removeEventListener(TimerEvent.TIMER,Run);
         incomeTimer = null;
      }
      
      public function Run(event:TimerEvent) : void
      {
         theStage.dispatchEvent(new incomeEv("income"));
      }
      
      public function killAll() : void
      {
         var i:* = undefined;
         for(i in unitKon.masterUnitArray)
         {
            unitKon.removeUnit(unitKon.masterUnitArray[i]);
         }
         for(i in displayArray)
         {
            if(displayArray[i] != null)
            {
               displayArray[i].killEvents();
            }
         }
      }
   }
}

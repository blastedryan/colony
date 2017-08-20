package
{
   public class optionData
   {
      
      public static var LIST:Array = new Array();
      
      public static var LIST2:Array = new Array();
       
      
      private var iN:Number = -1;
      
      private var option:Array;
      
      private var mul:Number;
      
      public function optionData()
      {
         option = new Array();
         mul = 1 + Math.random() * 4;
         super();
         make(0,0,0,5,"Destroy",[0,24],"Demolish this building to make room for a new one.");
         option.buildOrder = 0;
         make(0,0,0,1,"Main Base",[0,0],"X");
         option.buildOrder = 1;
         make(40,30,30,5,"Build Outpost",[1,0],"You can deploy marines, tanks, and other combat vehicles from this building.");
         option.buildOrder = 2;
         make(40,30,30,5,"Build Forge",[1,0],"You can deploy sky drones and andriod forces from this building.");
         option.buildOrder = 3;
         make(40,10,30,5,"Build Hospital",[1,0],"Treat the wounded, and deploy meditecs from this building.");
         option.buildOrder = 4;
         make(50,0,0,10,"Build Bank",[1,0],"This building allows you to gain financial resources.");
         option.buildOrder = 5;
         make(60,25,25,15,"Build Armory",[1,0],"This building allows to call in any additional supplies.");
         option.buildOrder = 6;
         make(50,0,0,10,"Build Generator",[1,0],"This building allows you to gain energy resources.");
         option.buildOrder = 7;
         make(80,30,30,20,"Build Special Operations",[1,0],"Launch missiles from this building.");
         option.buildOrder = 8;
         make(30,0,0,17,"Upgrade to Barracks",[1,0],"Upgrade this building into a Barracks (Tier 2).");
         option.buildOrder = 9;
         make(60,0,0,15,"Upgrade to Manufactory",[1,0],"Upgrade this building into a Manfactory (Tier 2).");
         option.buildOrder = 10;
         make(50,0,0,15,"Upgrade to Treasury",[1,0],"Upgrade this building into a Treasury (Tier 3).");
         option.buildOrder = 13;
         make(50,0,0,15,"Upgrade to Solar Grid",[1,0],"Upgrade this building into a Solar Grid (Tier 3).");
         option.buildOrder = 14;
         make(0,2,0,1.2,"Deploy Marine",[0,6],"Light infantry unit, armed with shocks rifles and anti-air rockets.");
         option.buildUnits = new Array([1]);
         make(5,10,0,5,"Deploy Chronite Tank",[0,7],"Heavily armored vehicle. Fires explosive shells at ground targets.");
         option.buildUnits = new Array([2]);
         make(3,0,7,4,"Deploy Scout",[0,8],"Fast flying drone with light armor. Fitted with formidable chronite-piercing weapons.");
         option.buildUnits = new Array([3]);
         make(0,0,5,1.2,"Deploy A25-Roman",[0,9],"Standard andriod soldier, armed with pulse rifles. Cannot attack air units.");
         option.buildUnits = new Array([4]);
         make(0,6,0,6,"Deploy Meditec",[0,10],"Light infantry unit that heals injured men and fixes any damaged ground vehicles.");
         option.buildUnits = new Array([5]);
         make(5,16,0,5,"Deploy Gröditz",[0,12],"Heavy bi-pedal \'Walker\' unit with rapid firing weapons, effective against both ground and air targets.");
         option.buildUnits = new Array([6]);
         make(23,5,3,7.3,"Deploy Phantom",[0,13],"Assault helicopter that can rain down rapid fire against ground targets, but cannot fire at air targets.");
         option.buildUnits = new Array([7]);
         make(0,0,21,5,"Deploy Sakata Mk-II",[0,14],"Standard Sakata body, fitted with strong anti-air cannons, but unable to attack ground targets.");
         option.buildUnits = new Array([9]);
         make(0,0,23,3,"Deploy Sakata Spider",[0,15],"Fast and heavily armored assault unit with self-healing capabilities. Cannot attack air targets.");
         option.buildUnits = new Array([8]);
         make(0,30,10,3,"Deploy Hover Tank",[0,16],"Specially armored tank, equipped with deadly anti-Chronite ground weapons.");
         option.buildUnits = new Array([10]);
         make(30,50,25,15,"Deploy Black Queen",[0,17],"Heavily armored air superiority fighter. Can drop bombs on ground targets every 12 seconds.");
         option.buildUnits = new Array([11]);
         make(7,12,0,1.6,"Deploy Sniper",[0,11],"Light infantry unit, armed with a long range anti-Chronite sniper rifle.");
         option.buildUnits = new Array([12]);
         make(0,0,0,5,"Resuscitate",[0,20],"Gain 3 additional manpower over 5 seconds.");
         option.buildResource[1] = 3;
         make(0,0,0,4.8,"Stock Exhange",[0,19],"Gain 3 additional money over 5 seconds.");
         option.buildResource[0] = 3;
         make(0,0,0,4.8,"Generate Power",[0,21],"Gain 3 additional energy over 5 seconds.");
         option.buildResource[2] = 3;
         make(0,0,0,3,"Gold Trading",[0,19],"Gain 4 additional money over 3 seconds.");
         option.buildResource[0] = 4;
         make(0,0,0,3,"Absorb Power",[0,21],"Gain 4 additional energy over 3 seconds.");
         option.buildResource[2] = 4;
         make(0,0,0,10,"Plan Reinforcements",[0,20],"Gain 9 additional manpower over 10 seconds.");
         option.buildResource[1] = 9;
         make(0,0,0,10,"Plan Financial Support",[0,19],"Gain 9 additional money over 10 seconds.");
         option.buildResource[0] = 9;
         make(0,0,0,10,"Plan Reserve Energy",[0,21],"Gain 9 additional energy over 10 seconds.");
         option.buildResource[2] = 9;
         make(80,0,50,10,"Upgrade Structure",[1,0],"Uprade this building into an Arsenal (Tier 3). Requires an Armory to upgrade.");
         option.buildOrder = 11;
         option.buildReq = 6;
         make(70,0,20,10,"Upgrade Structure",[1,0],"Upgrade this building into a Mechanics Terminal (Tier 3). Requires an Armory to upgrade.");
         option.buildOrder = 12;
         option.buildReq = 6;
         make(0,0,0,5,"Salvage",[0,21],"Gain 2 energy over 5 seconds.");
         option.buildResource[2] = 2;
         make(0,0,0,30,"Create Clones",[0,20],"Gain 20 manpower over 30 seconds.");
         option.buildResource[1] = 20;
         make(60,0,15,1,"Launch Missile",[0,22],"Launches a deadly missile at enemies closest to the base.");
         option.buildMissile = 1;
         make(5,16,0,5,"Deploy Gröditz",[0,12],"Requires Armory to deploy. Heavy bi-pedal \'Walker\' unit with rapid firing weapons, effective against both ground and air targets.");
         option.buildUnits = new Array([6]);
         option.buildReq = 6;
         make(0,0,21,5,"Deploy Sakata Mk-II",[0,14],"Requires Armory to deploy. Standard Sakata body, fitted with strong anti-air cannons, but unable to attack ground targets.");
         option.buildUnits = new Array([9]);
         option.buildReq = 6;
         make(15,0,60,1,"Launch Missile",[0,23],"Launches a deadly missile at enemies closest to the base.");
         option.buildMissile = 1;
         make(75,20,0,1,"Convert to Avionics",[1,0],"Convert this building into an Avionics Terminal.");
         option.buildOrder = 15;
         make(3,0,6,2.5,"Deploy Scout",[0,8],"Fast flying drone with light armor. Fitted with formidable chronite-piercing weapons.");
         option.buildUnits = new Array([3]);
         make(30,10,25,15,"Deploy Gladiator",[0,18],"Specially developed branch of the Roman andriods, with stronger parts, and air-attack capabilities.");
         option.buildUnits = new Array([13]);
         make(0,0,0,3,"Recruit",[0,20],"Gain 1 manpower over 3 seconds.");
         option.buildResource[1] = 1;
         make(0,0,0,1,"Scramble Rescue Team",[0,25],"Instantly deploy 3 Meditecs.",20);
         option.buildUnits = new Array(5,5,5);
         make(0,0,0,1,"Deploy Modified Sakata",[0,26],"Deploy a specialized Sakata unit.",50);
         option.buildUnits = new Array([14]);
         make(0,0,0,1,"Deploy Modified Phantom",[0,27],"Deploy a specialized Phantom unit.",35);
         option.buildUnits = new Array([15]);
         make(0,0,0,1,"Deploy Special Forces",[0,28],"Deploy a team of highly trained infantry.",35);
         option.buildUnits = new Array(16,16,16,16,5,5,12,12);
         make(0,0,0,1,"Deploy Far Sniper",[0,29],"Deploy a specialized Sniper that can attack ground units at a very long range.",35);
         option.buildUnits = new Array([17]);
         make(0,0,0,5,"Black Operations",[0,30],"Gain 2 influence over 5 seconds.");
         option.buildResource[3] = 2;
         make(0,0,0,2,"Deploy Saint",[0,32],"Deploy a flying drone built with Hover Tank technology.",50);
         option.buildUnits = new Array([18]);
         make(0,0,0,2,"Deploy A27-Pride",[0,31],"Deploy an Android unit with long range suppressing fire.",40);
         option.buildUnits = new Array([19]);
         make(0,0,0,1,"Upgrade Marines",[0,36],"Upgrade Marines.",2);
         option.buildTech = 0;
         make(65,0,0,15,"Upgrade to War Sanctum",[1,0],"Upgrade this building into a War Sanctum (Tier 3).");
         option.buildOrder = 15;
         make(0,0,0,3,"Recover",[0,20],"Gain 4 additional manpower over 3 seconds.");
         option.buildResource[1] = 4;
         make(0,1,0,3,"Special Medic",[0,0],"",1);
         make(0,0,0,12,"Deploy Sphinx",[0,34],"Deploy a hybrid tank that resists heavy attacks. Equipped with anti-armor weapons.",80);
         option.buildUnits = new Array([20]);
      }
      
      private function make(a:uint, b:uint, c:uint, d:Number, e:String, f:Array, g:String, h:uint = 0) : void
      {
         iN++;
         LIST[iN] = new Array();
         LIST2[iN] = new Array();
         LIST[iN].push(a,b,c,d,h);
         LIST2[iN].push(a * mul,b * mul,c * mul,d * mul,h * mul);
         LIST[iN].orders = new Array();
         option = LIST[iN];
         option.id = iN;
         option.iconGraphic = new Array();
         option.iconGraphic[0] = f[0];
         option.iconGraphic[1] = f[1];
         option.nameLabel = e;
         option.buildOrder = null;
         option.buildResource = new Array(0,0,0,0);
         option.buildStock = null;
         option.buildTech = null;
         option.buildUnits = null;
         option.buildMissile = null;
         option.buildReq = null;
         option.stockReq = null;
         option.techReq = null;
         option.tip = new tipObject(e,a,b,c,g,h);
      }
      
      public function checkData() : Boolean
      {
         var i:* = undefined;
         var j:* = undefined;
         var boss:Number = NaN;
         for(i in LIST)
         {
            for(j in LIST[i])
            {
               boss = Math.round(LIST2[i][j] / mul * 1000) / 1000;
               if(LIST2[i][j] != null && LIST[i][j] != boss)
               {
                  trace("OPTION: (" + i + " " + j + ") // " + LIST[i][j] + " -- " + boss);
                  return true;
               }
            }
         }
         return false;
      }
   }
}

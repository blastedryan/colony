package
{
   public class unitData
   {
      
      public static var LIST:Array = new Array();
      
      public static var LIST2:Array = new Array();
       
      
      private var iN:Number = -1;
      
      private var unit:Array;
      
      public var mul:Number;
      
      public function unitData()
      {
         unit = new Array();
         super();
         mul = 1 + Math.random() * 4;
         make("Central Base",false,5000,0,0,3,1,15,false,0,"This is the headquarters. Equipped with powerful defensive weapons.",0,0,3);
         make("Marine",false,62,3,1,0,0,16,false,0,"Light armor. Armed with shock rifles and rockets, effective against both ground and air.",25,16.4);
         unit.Value = 1;
         unit.deathSound = 3;
         make("Chronite Tank",false,310,1,2,2,3,null,false,0,"Chronite (heavy) armor. Armed with explosive shells, but cannot fire at air targets.",100,10,3);
         unit.Value = 5;
         unit.deathSound = 4;
         make("Scout",true,140,5,11,1,11,11,false,0,"Titanium armor. Armed with pulse lasers. ",57,44,3);
         unit.Value = 3;
         unit.deathSound = 6;
         make("A25-Roman",false,250,4,4,1,13,null,false,0,"Titanium armor. Armed with pulse rifles, but cannot fire at air targets.",22,16);
         unit.Value = 2;
         unit.deathSound = 5;
         make("Meditec",false,100,3,12,0,12,null,true,0,"Light armor. Can heal/repair any friendly ground unit.",22,16);
         unit.Value = 2;
         unit.deathSound = 3;
         make("Gröditz",false,340,2,7,2,5,5,false,0,"Chronite (heavy) armor. Armed with standard machine guns.",47,32,3);
         unit.Value = 7;
         unit.deathSound = 4;
         make("Phantom",true,320,4,3,1,8,null,false,0,"Titanium armor. Armed with area-damage rapid cannons.",61,43.3,3);
         unit.Value = 7;
         unit.deathSound = 4;
         make("Sakata Spider",false,350,4,8,2,6,null,false,0.57,"Chronite (heavy) armor. Armed with singular voltage beams. Self repairing technology.",54,5,3);
         unit.Value = 10;
         unit.deathSound = 4;
         make("Sakata Mk-II",false,200,4,9,4,null,7,false,0.3,"Special armor. Armed with anti-air Hadron cannons. Cannot attack ground targets.",64,5,3);
         unit.Value = 7;
         unit.deathSound = 4;
         make("Hover Tank",false,370,3,6,4,4,null,false,0,"Special armor, resistant against missile damage. Armed with high impact, linear Positron cannons.",102,10,3);
         unit.Value = 10;
         unit.deathSound = 4;
         make("Black Queen",true,550,4,10,4,9,10,false,0,"Special armor, resistant against missile damage. Armed with anti-air missiles, and long ranged bombs.",46,37,3);
         unit.Value = 15;
         unit.deathSound = 1;
         make("Sniper",false,154,4,5,0,2,14,false,0,"Light armor. Equipped with armor-piercing Positron rifles. Not as effective against air targets.",38,9.3);
         unit.Value = 3;
         unit.deathSound = 3;
         make("A28-Gladiator",false,650,6,13,4,17,18,false,0,"Special armor, resistant against missile damage. Armed with a high frequency pulse rifle.  Not as effective against air targets.",22,16);
         unit.Value = 15;
         unit.deathSound = 2;
         make("Mod. Sakata",false,450,6,14,2,19,null,false,2,"Modified to be faster in movement, firing, and repairing.",54,5,3);
         unit.Value = 12;
         unit.deathSound = 4;
         make("Mod. Phantom",true,400,5,15,1,20,null,false,0,"Modified to have stronger weapons and more durable armor.",61,43.3,3);
         unit.Value = 12;
         unit.deathSound = 4;
         make("S-Marine",false,230,5,1,0,21,22,false,0.3,"Specially trained to live longer, and do more damage.",25,16.4);
         unit.Value = 6;
         unit.deathSound = 3;
         make("Far Sniper",false,120,4,16,0,23,null,false,0,"Light armor. Equipped with armor-piercing Positron rifles. Massive range, but cannot attack air units.",38,9.3);
         unit.Value = 3;
         unit.deathSound = 3;
         make("Saint",true,400,5,18,4,25,4,false,0.2,"Special armor. Armed with anti-air Positron cannons, and rapid ground rifles. Self-repairing technology.",53,48.5,3);
         unit.Value = 15;
         unit.deathSound = 6;
         make("A27-Pride",false,350,4,17,4,24,24,false,0,"Special armor, resistant against missile damage. Armed with a high range pulse rifle.",22,16);
         unit.Value = 15;
         unit.deathSound = 2;
         make("Sphinx",false,1300,2,19,5,26,27,false,0,"Composite Armor, effective against heavy attacks, but weak against light attacks. Fires anti-special armor shells.",59,15,3);
         unit.Value = 15;
         unit.deathSound = 4;
      }
      
      private function make(a:String, b:Boolean, c:uint, d:uint, e:uint, f:uint, g:*, h:*, i:Boolean, j:Number, k:String, l:Number = 0, m:Number = 0, o:uint = 0) : void
      {
         iN++;
         LIST[iN] = new Array();
         LIST2[iN] = new Array();
         doMake(LIST[iN],1,a,b,c,d,e,f,g,h,i,j,k,l,m,o);
         doMake(LIST2[iN],mul,a,b,c,d,e,f,g,h,i,j,k,l,m,o);
         unit = LIST[iN];
      }
      
      private function doMake(unit:Array, multi:Number, a:String, b:Boolean, c:uint, d:uint, e:uint, f:uint, g:*, h:*, i:Boolean, j:Number, k:String, l:Number = 0, m:Number = 0, o:uint = 0) : void
      {
         unit.Name = a;
         unit.Air = b;
         unit.Life = c * multi;
         unit.Speed = d * multi;
         unit.Graphic = e * multi;
         unit.Armor = f * multi;
         unit.Weapon_G = g;
         unit.Weapon_A = h;
         unit.Healer = i;
         unit.selfHeal = j * multi;
         unit.Desc = k;
         unit.setX = l * multi;
         unit.setY = m * multi;
         unit.exDie = o;
         unit.deathSound = 0;
         unit.Value = 0;
      }
      
      public function checkData() : Boolean
      {
         var i:* = undefined;
         var j:* = undefined;
         var boss:Number = NaN;
         var checkData:* = ["Life","Speed","Graphic","Armor","selfHeal","setX","setY"];
         for(i in LIST)
         {
            for(j in checkData)
            {
               boss = Math.round(LIST2[i][checkData[j]] / mul * 1000) / 1000;
               if(LIST[i][checkData[j]] != boss)
               {
                  trace("UNIT: " + LIST[i][checkData[j]] + " -- " + boss);
                  return true;
               }
            }
         }
         return false;
      }
   }
}

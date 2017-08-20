package
{
   public class buildingData
   {
      
      public static var LIST:Array = new Array();
       
      
      private var iN:Number = -1;
      
      private var build:Array;
      
      public function buildingData()
      {
         build = new Array();
         super();
         make("Ground Zero",0,"This is an underground construction site.");
         build.options = [2,3,4,5,6,7,8,null];
         make("Main",1,"Main");
         build.options = [null,null,null,null,null,null,null,null];
         make("Outpost",2,"This is a Tier-1 unit deployment structure.");
         build.options = [13,14,44,9,null,null,null,0];
         make("Forge",5,"This is a Tier-1 unit deployment structure.");
         build.options = [16,15,35,10,null,null,null,0];
         make("Hospital",12,"This is a Tier-1 hybrid structure.");
         build.options = [25,17,45,54,null,null,null,0];
         make("Bank",10,"This is a Tier-1 resource structure.");
         build.options = [26,11,0,null,null,null,null,null];
         build.autoBuild = 0;
         make("Armory",13,"This is a Tier-2 resource structure.");
         build.options = [31,30,32,47,null,null,null,0];
         make("Generator",8,"This is a Tier-1 resource structure.");
         build.options = [27,12,0,null,null,null,null,null];
         build.autoBuild = 0;
         make("Special Operations",14,"This is a Tier-3 weapons structure.");
         build.options = [37,40,null,50,48,49,52,0];
         make("Barracks",3,"This is a Tier-2 unit deployment structure.");
         build.options = [13,14,24,38,44,33,null,0];
         make("Manufactory",6,"This is a Tier-2 unit deployment structure.");
         build.options = [16,15,19,39,35,34,null,0];
         make("Arsenal",4,"This is a Tier-3 unit deployment structure.");
         build.options = [13,14,24,18,22,23,44,0];
         make("Mechanics Terminal",7,"This is a Tier-3 unit deployment structure.");
         build.options = [16,15,19,20,21,43,35,0];
         make("Treasury",11,"This is a Tier-3 resource structure.");
         build.options = [28,0,null,null,null,null,null,null];
         build.autoBuild = 0;
         make("Solar Grid",9,"This is a Tier-3 resource structure.");
         build.options = [29,46,0,null,null,null,null,null];
         build.autoBuild = 0;
         make("War Sanctum",15,"This is a Tier-3 resource structure.");
         build.options = [55,17,45,51,57,null,null,0];
      }
      
      private function make(a:String, b:uint, c:String) : void
      {
         iN++;
         LIST[iN] = new Array();
         LIST[iN].push(a,b,c);
         LIST[iN].options = new Array();
         LIST[iN].autoBuild = null;
         build = LIST[iN];
      }
   }
}

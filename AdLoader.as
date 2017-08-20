package
{
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class AdLoader
   {
      
      private static var cpmstarLoader:Loader;
       
      
      public function AdLoader()
      {
         super();
      }
      
      public static function LoadAd(poolid:int, subpoolid:int) : DisplayObject
      {
         Security.allowDomain("server.cpmstar.com");
         var cpmstarViewSWFUrl:String = "http://server.cpmstar.com/adviewas3.swf";
         cpmstarLoader = new Loader();
         cpmstarLoader.load(new URLRequest(cpmstarViewSWFUrl + "?poolid=" + poolid + "&subpoolid=" + subpoolid));
         return cpmstarLoader;
      }
   }
}

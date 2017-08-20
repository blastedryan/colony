package it.gotoandplay.smartfoxserver.http
{
   import flash.events.Event;
   
   public class HttpEvent extends Event
   {
      
      public static const onHttpData:String = "onHttpData";
      
      public static const onHttpError:String = "onHttpError";
      
      public static const onHttpConnect:String = "onHttpConnect";
      
      public static const onHttpClose:String = "onHttpClose";
       
      
      public var params:Object;
      
      private var evtType:String;
      
      public function HttpEvent(type:String, params:Object)
      {
         super(type);
         this.params = params;
         this.evtType = type;
      }
      
      override public function clone() : Event
      {
         return new HttpEvent(this.evtType,this.params);
      }
      
      override public function toString() : String
      {
         return formatToString("HttpEvent","type","bubbles","cancelable","eventPhase","params");
      }
   }
}

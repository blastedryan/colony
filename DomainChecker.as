package
{
   import flash.display.Stage;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class DomainChecker
   {
       
      
      public function DomainChecker()
      {
         super();
      }
      
      public static function getDomain(stage:Stage) : String
      {
         var url:String = stage.loaderInfo.url;
         var urlStart:int = url.indexOf(":/") + 3;
         var urlEnd:int = url.indexOf("/",urlStart);
         var domain:String = url.substring(urlStart,urlEnd);
         var lastDot:int = domain.lastIndexOf(".") - 1;
         var domEnd:int = domain.lastIndexOf(".",lastDot) + 1;
         domain = domain.substring(domEnd,domain.length);
         return domain;
      }
      
      public static function isDomain(stage:Stage, ... args) : Boolean
      {
         var domain:String = getDomain(stage);
         var isOn:Boolean = false;
         for(var i:int = 0; i < args.length; i++)
         {
            if(domain == args[i])
            {
               isOn = true;
            }
         }
         return Boolean(isOn || domain == "");
      }
      
      public static function isLocal(stage:Stage) : Boolean
      {
         return Boolean(getDomain(stage) == "");
      }
      
      public static function displayMessage(stage:Stage, message:String) : void
      {
         var tf:TextField = new TextField();
         tf.width = stage.stageWidth;
         tf.x = 0;
         tf.y = stage.stageHeight * 0.5 - 50;
         tf.textColor = 16777215;
         tf.defaultTextFormat = new TextFormat("Times New Roman",14,16777215,true,null,null,null,null,"center");
         tf.text = message;
         tf.mouseEnabled = false;
         stage.addChild(tf);
      }
   }
}

package
{
   public class chatMission6
   {
       
      
      public function chatMission6()
      {
         super();
      }
      
      public static function runAiChat(a:uint) : *
      {
         switch(a)
         {
            case 0:
               chatOrder.SET(false,0,0);
               break;
            case 1:
               chatBody.sayWhat("Good evening Mr Moston. I\'m Julio Haxel, I\'ve been assigned to help you with tonight\'s mission.");
               chatBody.resetAll(true);
               chatOrder.SET(false,0,0);
         }
      }
   }
}

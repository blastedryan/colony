package it.gotoandplay.smartfoxserver.http
{
   public class RawProtocolCodec implements IHttpProtocolCodec
   {
      
      private static const SESSION_ID_LEN:int = 32;
       
      
      public function RawProtocolCodec()
      {
         super();
      }
      
      public function encode(sessionId:String, message:String) : String
      {
         return (sessionId == null?"":sessionId) + message;
      }
      
      public function decode(message:String) : String
      {
         var decoded:* = null;
         if(message.charAt(0) == HttpConnection.HANDSHAKE_TOKEN)
         {
            decoded = message.substr(1,SESSION_ID_LEN);
         }
         return decoded;
      }
   }
}

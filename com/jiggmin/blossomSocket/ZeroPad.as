package com.jiggmin.blossomSocket
{
   import com.hurlant.crypto.symmetric.IPad;
   import flash.utils.ByteArray;
   
   public class ZeroPad implements IPad
   {
       
      
      private var blockSize:uint;
      
      private var char:String;
      
      public function ZeroPad(blockSize:uint = 0)
      {
         char = String.fromCharCode(0);
         super();
         this.blockSize = blockSize;
      }
      
      public function pad(a:ByteArray) : void
      {
         while(a.length % blockSize != 0)
         {
            a.writeUTFBytes(char);
         }
      }
      
      public function unpad(a:ByteArray) : void
      {
         a.position = 0;
         var string:String = a.readUTFBytes(a.bytesAvailable);
         string.split(char).join("");
         a.writeUTFBytes(string);
      }
      
      public function setBlockSize(bs:uint) : void
      {
         blockSize = bs;
      }
   }
}

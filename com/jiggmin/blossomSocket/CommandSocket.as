package com.jiggmin.blossomSocket
{
   import flash.events.ProgressEvent;
   
   public class CommandSocket extends BasicSocket
   {
       
      
      private var encryptor:Encryptor;
      
      private var sendBuffer:Array;
      
      private var encrypt:Boolean = false;
      
      private var readNum:int = 0;
      
      private var writeNum:int = 0;
      
      private var readBuffer:String = "";
      
      private var EOL:String;
      
      public var traceTraffic:Boolean = false;
      
      public function CommandSocket()
      {
         sendBuffer = new Array();
         EOL = String.fromCharCode(4);
         super();
         encryptor = new Encryptor();
         addEventListener(BlossomEvent.RECEIVE_IV,receiveIVHandler,false,0,true);
         addEventListener(BlossomEvent.READY,readyHandler,false,0,true);
      }
      
      private function receiveIVHandler(be:BlossomEvent) : void
      {
         var obj:* = null;
         if(encrypt == true)
         {
            obj = new Object();
            obj.type = "confirm_iv";
            send(obj);
         }
         var iv:String = be.iv;
         encryptor.setIV(iv);
         encrypt = true;
      }
      
      private function readyHandler(be:BlossomEvent) : void
      {
         var obj:* = null;
         for each(obj in sendBuffer)
         {
            send(obj);
         }
         sendBuffer = new Array();
      }
      
      public function setKey(stringKey:String) : void
      {
         encryptor.setKey(stringKey);
      }
      
      override protected function socketDataHandler(e:ProgressEvent) : void
      {
         readBytesAvailable();
         super.socketDataHandler(e);
      }
      
      protected function send(obj:Object) : void
      {
         var strObj:* = null;
         var sendStr:* = null;
         if(connected)
         {
            writeNum++;
            obj.write_num = writeNum;
            strObj = com.adobe.serialization.json.JSON.encode(obj);
            if(encrypt)
            {
               sendStr = encryptor.encrypt(strObj);
            }
            else
            {
               sendStr = strObj;
            }
            sendStr = sendStr + EOL;
            write(sendStr);
            if(traceTraffic)
            {
               trace("write: " + strObj);
               dataTracer.update("write: " + strObj);
            }
         }
         else
         {
            sendBuffer.push(obj);
         }
      }
      
      protected function readBytesAvailable() : void
      {
         var index:int = 0;
         var command:* = null;
         var str:String = readUTFBytes(bytesAvailable);
         if(str != null)
         {
            readBuffer = readBuffer + str;
            while(true)
            {
               index = readBuffer.indexOf(EOL);
               if(index == -1)
               {
                  break;
               }
               command = readBuffer.substring(0,index);
               readBuffer = readBuffer.substr(index + 1);
               receiveCommand(command);
            }
         }
      }
      
      protected function receiveCommand(command:String) : void
      {
         var stringVars:* = null;
         readNum++;
         var spaceIndex:int = command.indexOf(" ");
         var remoteSendNum:int = int(command.substr(0,spaceIndex));
         command = command.substr(spaceIndex + 1);
         if(remoteSendNum != readNum)
         {
            throw new Error("readCount does not match messageNum. readNum: " + readNum + ", remoteSendNum: " + remoteSendNum);
         }
         if(encrypt)
         {
            stringVars = encryptor.decrypt(command);
         }
         else
         {
            stringVars = command;
         }
         if(traceTraffic)
         {
            dataTracer.update("received: " + stringVars);
            trace("received: " + stringVars);
         }
         var obj:Object = com.adobe.serialization.json.JSON.decode(stringVars);
         handleMessage(obj);
      }
      
      protected function handleMessage(obj:Object) : void
      {
         var type:* = null;
         if(obj.type == null || obj.type == "")
         {
            type = BlossomEvent.RECEIVE_MESSAGE;
         }
         else
         {
            type = obj.type;
         }
         var blossomEvent:BlossomEvent = new BlossomEvent(type,obj,null);
         dispatchEvent(blossomEvent);
      }
      
      override public function remove() : void
      {
         removeEventListener(BlossomEvent.RECEIVE_IV,receiveIVHandler);
         removeEventListener(BlossomEvent.READY,readyHandler);
         if(encryptor != null)
         {
            encryptor.remove();
            encryptor = null;
         }
         super.remove();
      }
   }
}

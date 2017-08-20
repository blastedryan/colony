package com.adobe.serialization.json
{
   import flash.utils.describeType;
   
   public class JSONEncoder
   {
       
      
      private var jsonString:String;
      
      public function JSONEncoder(value:*)
      {
         super();
         jsonString = convertToString(value);
      }
      
      public function getString() : String
      {
         return jsonString;
      }
      
      private function convertToString(value:*) : String
      {
         if(value is String)
         {
            return escapeString(value as String);
         }
         if(value is Number)
         {
            return !!isFinite(value as Number)?value.toString():"null";
         }
         if(value is Boolean)
         {
            return !!value?"true":"false";
         }
         if(value is Array)
         {
            return arrayToString(value as Array);
         }
         if(value is Object && value != null)
         {
            return objectToString(value);
         }
         return "null";
      }
      
      private function escapeString(str:String) : String
      {
         var ch:* = null;
         var hexCode:* = null;
         var zeroPad:* = null;
         var s:* = "";
         var len:Number = str.length;
         for(var i:int = 0; i < len; i++)
         {
            ch = str.charAt(i);
            switch(ch)
            {
               case "\"":
                  s = s + "\\\"";
                  break;
               case "\\":
                  s = s + "\\\\";
                  break;
               case "\b":
                  s = s + "\\b";
                  break;
               case "\f":
                  s = s + "\\f";
                  break;
               case "\n":
                  s = s + "\\n";
                  break;
               case "\r":
                  s = s + "\\r";
                  break;
               case "\t":
                  s = s + "\\t";
                  break;
               default:
                  if(ch < " ")
                  {
                     hexCode = ch.charCodeAt(0).toString(16);
                     zeroPad = hexCode.length == 2?"00":"000";
                     s = s + ("\\u" + zeroPad + hexCode);
                     break;
                  }
                  s = s + ch;
                  break;
            }
         }
         return "\"" + s + "\"";
      }
      
      private function arrayToString(a:Array) : String
      {
         var s:* = "";
         for(var i:int = 0; i < a.length; i++)
         {
            if(s.length > 0)
            {
               s = s + ",";
            }
            s = s + convertToString(a[i]);
         }
         return "[" + s + "]";
      }
      
      private function objectToString(o:Object) : String
      {
         var value:Object = null;
         var key:String = null;
         var v:XML = null;
         var s:String = "";
         var classInfo:XML = describeType(o);
         if(classInfo.@name.toString() == "Object")
         {
            for(key in o)
            {
               value = o[key];
               if(!(value is Function))
               {
                  if(s.length > 0)
                  {
                     s = s + ",";
                  }
                  s = s + (escapeString(key) + ":" + convertToString(value));
               }
            }
         }
         else
         {
            for each(v in classInfo..*.(name() == "variable" || name() == "accessor"))
            {
               if(s.length > 0)
               {
                  s = s + ",";
               }
               s = s + (escapeString(v.@name.toString()) + ":" + convertToString(o[v.@name]));
            }
         }
         return "{" + s + "}";
      }
   }
}

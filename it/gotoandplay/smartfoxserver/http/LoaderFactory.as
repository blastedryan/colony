package it.gotoandplay.smartfoxserver.http
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   
   public class LoaderFactory
   {
      
      private static const DEFAULT_POOL_SIZE:int = 8;
       
      
      private var loadersPool:Array;
      
      private var currentLoaderIndex:int;
      
      public function LoaderFactory(responseHandler:Function, errorHandler:Function, poolSize:int = 8)
      {
         var urlLoader:* = null;
         super();
         loadersPool = [];
         for(var i:int = 0; i < poolSize; i++)
         {
            urlLoader = new URLLoader();
            urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
            urlLoader.addEventListener(Event.COMPLETE,responseHandler);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
            urlLoader.addEventListener(IOErrorEvent.NETWORK_ERROR,errorHandler);
            loadersPool.push(urlLoader);
         }
         currentLoaderIndex = 0;
      }
      
      public function getLoader() : URLLoader
      {
         var urlLoader:URLLoader = loadersPool[currentLoaderIndex];
         currentLoaderIndex++;
         if(currentLoaderIndex >= loadersPool.length)
         {
            currentLoaderIndex = 0;
         }
         return urlLoader;
      }
   }
}

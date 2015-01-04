package com.hendrix.http.core.process.interfaces
{
  public interface IProcessable
  {
    /**
     * stop proceesing the item
     */
    function stop():void;
    
    /**
     * process the item
     */
    function process($onComplete:Function = null, $onError:Function = null):void;
    
    /**
     * running or not
     */
    function isRunning():Boolean
    
    /**
     * notify completion
     */
    function notifyComplete(res:Object = null):void;
    
    /**
     * notify error
     */
    function notifyError(res:Object = null):void;
  }
}
package com.hendrix.http.core.process.types
{ 
  import com.hendrix.http.core.process.interfaces.IProcess;
  
  public class BaseProcess implements IProcess
  {
    protected var _onComplete:    Function  = null;
    protected var _onError:       Function  = null;
    
    protected var _priorityKey:   Object    = null;
    protected var _id:            String    = null;
    
    protected var _isRunning:     Boolean   = false;
    
    /**
     * a base process that implements <code>IProcess</code>, helpful to make implementation of
     * an <code>IProcess</code> easy. programmer can implement <code>IProcess</code> directly without
     * this class
     * @see com.mreshet.mrProcessManager.core.interfaces.IProcess
     * @author Tomer Shalev
     */
    public function BaseProcess($id:String = null, $priorityKey:Object = 10)
    {
      _id = $id;
      
      _priorityKey = $priorityKey;
    }
    
    /**
     * will notifyError if process is already running.
     * @inheritDoc 
     * 
     *  
     */
    public function process($onComplete:Function=null, $onError:Function=null):void
    {
      if(_isRunning)
        notifyError();
      
      _onComplete = $onComplete;
      _onError    = $onError;
      
      _isRunning  = true;
    }
    
    /**
     * @inheritDoc 
     */
    public function stop():void
    {
      _isRunning  = false;
    }
    
    public function isRunning():Boolean
    {
      return _isRunning;
    }
    
    /**
     * @inheritDoc 
     */
    public function notifyComplete(res:Object = null):void
    {
      res = res ? res : this;
      
      if(_onComplete is Function)
        _onComplete(res);
      
      _isRunning  = false;
    }
    
    /**
     * @inheritDoc 
     */
    public function notifyError(res:Object = null):void
    {
      res = res ? res : this;
      
      if(_onError is Function)
        _onError(res);
      
      _isRunning  = false;
    }
    
    /**
     * @inheritDoc 
     */
    public function dispose():void
    {
      _onComplete = null;
      _isRunning  = false;
    }
    
    /**
     * @inheritDoc 
     */
    public function get id():String
    {
      return _id;
    }
    
    /**
     * @inheritDoc 
     */
    public function set id(value:String):void
    {
      _id = value;
    }
    
    /**
     * @inheritDoc 
     */
    public function get priorityKey():Object
    {
      return _priorityKey;
    }
    
    /**
     * @inheritDoc 
     */
    public function set priorityKey(value:Object):void
    {
      _priorityKey = value;
    }
  }
}
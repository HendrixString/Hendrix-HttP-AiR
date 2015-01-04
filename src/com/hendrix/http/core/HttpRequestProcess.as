package com.hendrix.http.core
{
  
  import com.hendrix.http.Request;
  import com.hendrix.http.core.process.types.BaseProcess;
  import com.hendrix.http.utils.NetUtils;
  
  import flash.events.Event;
  import flash.events.HTTPStatusEvent;
  import flash.events.IOErrorEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.net.URLVariables;
  import flash.utils.Dictionary;
  
  import org.osflash.vanilla.extract;
  
  /**
   * HTTP Request carrier
   * @author Tomer Shalev
   */
  public class HttpRequestProcess extends BaseProcess
  {
    protected var _ur:                URLRequest    = null;
    protected var _ul:                URLLoader     = null;
    protected var _uv:                URLVariables  = null;
    
    protected var _host:              String        = null;
    protected var _relative_path:     String        = null;
    protected var _query:             Dictionary    = null;
    
    protected var _request:           Request       = null;
    protected var _requestString:     String        = null;
    
    public var dataResponse:          Object        = null;
    
    /**
     * process an HTTP Request object 
     * @param $request the Request object
     * @see com.hendrix.http.Request
     */
    public function HttpRequestProcess($request:Request = null, $id:  String  = null, $priorityKey: Object = 10)
    {
      super($id, $priorityKey);
      
      _request  = $request;
      
      _ur       = new URLRequest(_host);
      _ul       = new URLLoader(null);
      _uv       = new URLVariables();
      
      _ur.data  = _uv;
      
      _query    = new Dictionary();
      
      _ul.addEventListener(HTTPStatusEvent.HTTP_STATUS, ul_onStatus);
    }
    
    /**
     * set/get request details 
     */
    public function get request():Request { return _request;  }
    /**
     * @private
     */
    public function set request(value:Request):void
    {
      _request = value;
    }
    
    /**
     * process the HTTP request 
     * @param $onComplete a callback for successful response
     * @param $onError a callback for error response
     */
    override public function process($onComplete:Function=null, $onError:Function=null):void
    {
      super.process($onComplete, $onError);
      
      prepareRequest();
      
      try {
        addListeners(true);
        
        _ul.load(_ur);
      }
      catch (err:Error) {
        ul_onError(null);
      }
      finally {
      }
      
    }
    
    override public function dispose():void
    {
      super.dispose();
      
      stop();
      
      _ur = null;
      _ul = null;
      _uv = null;
      
      dataResponse  = null;
    }
    
    override public function stop():void
    {
      super.stop();
      
      addListeners(false);
      
      try {
        _ul.close();
      }
      catch(err:Error) {
        
      }
      finally {
      }
    }
    
    
    /**
     * here prepare the HTTP request 
     * 
     */
    protected function prepareRequest():void
    {
      _ur.url             = _request.url;
      _ur.method          = _request.method;
      _ur.requestHeaders  = _request.headers;
      
      if(_request.body) {
        _ur.data          = _request.body.content;
        _ur.contentType   = _request.body.contentType;
      }
      
      if(_request.queryParams) {
        _ur.url          += NetUtils.ObjectToQueryString(_request.queryParams);
      }
      
    }
    
    protected function addListeners(on:Boolean = true):void
    {
      if(on) {
        _ul.addEventListener(IOErrorEvent.IO_ERROR,       ul_onError);
        _ul.addEventListener(Event.COMPLETE,              ul_onComplete);
      }
      else {
        _ul.removeEventListener(IOErrorEvent.IO_ERROR,    ul_onError);
        _ul.removeEventListener(Event.COMPLETE,           ul_onComplete);
      }
      
    }
    
    protected function ul_onStatus(event:HTTPStatusEvent):void
    {
      trace(event);
    }
    
    protected function ul_onComplete(event:Event):void
    {
      dataResponse  = (event.currentTarget as URLLoader).data;
      
      var res:Object = null; 
      
      try{
        if(dataResponse && _request.classResponse)
          res = extract(JSON.parse(dataResponse as String), _request.classResponse);
        else
          res = dataResponse;
      }
      catch(err:Error){
        trace(err);
      }
      
      notifyComplete(res);
    }
    
    protected function ul_onError(event:IOErrorEvent):void
    {
      trace(event.currentTarget.data);
      
      dataResponse  = (event.currentTarget as URLLoader).data;
      
      notifyError(dataResponse);
    }
    
    /**
     * host 
     */
    public function get host():String { return _host; }
    public function set host(value:String):void
    {
      _host = value;
    }
    
    /**
     * relative path 
     */
    public function get relative_path():String  { return _relative_path;  }
    public function set relative_path(value:String):void
    {
      _relative_path = value;
    }
    
    /**
     * query parameters 
     */
    public function get query():Dictionary
    {
      return _query;
    }
    /**
     * @private
     */
    public function set query(value:Dictionary):void
    {
      _query = value;
    }
    
  }
  
}
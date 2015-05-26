package com.hendrix.http
{
  import com.hendrix.http.core.HttpRequestProcess;
  
  import flash.net.URLRequestMethod;
  
  /**
   * Request class, represents an HTTP Request. 
   * @author Tomer Shalev
   * 
   */
  public class Request
  {
    private var _method:        String      = URLRequestMethod.GET;
    private var _url:           String      = null;
    private var _body:          RequestBody = null;
    private var _headers:       Array       = null;
    private var _queryParams:   Object      = null;
    private var _classResponse: Class       = null;
    
    /**
     * the actual HTTP process, that uses this request to generate the actual HTTP request 
     */
    private var _httpRequest:HttpRequestProcess = null;
    
    public var onComplete:Function = null;
    public var onError:Function = null;
    
    public function get httpRequest():HttpRequestProcess
    {
      return _httpRequest;
    }
    
    /**
     * stop the request 
     */
    public function stop():void
    {
      _httpRequest.stop();  
    }
    
    /**
     * Request class, represents an HTTP Request. 
     */
    public function Request()
    {
      _headers      = new Array();
      
      _queryParams  = new Object();
      
      _httpRequest  = new HttpRequestProcess(this);
    }
    
    /**
     * execute the request, using it's HTTP carrier 
     * @param $onComplete a callback function for succesful response 
     * @param $onError a callback function for error response
     * 
     */
    public function execute($onComplete:Function = null, $onError:Function = null):void
    {
      if($onComplete is Function)
        onComplete  = $onComplete;
      
      if($onError is Function)
        onError     = $onError;
      
      _httpRequest.process(onComplete, onError);
    }
    
    /**
     * array of <code>URLRequestHeader</code> for the request.
     * @see flash.net.URLRequestHeader.URLRequestHeader
     */
    public function get headers():Array { return _headers;  }
    /**
     * @private
     */
    public function set headers(value:Array):void
    {
      _headers = value;
    }
    
    /**
     * the body of the request 
     */
    public function get body():RequestBody  { return _body; }
    /**
     * @private
     */
    public function set body(value:RequestBody):void
    {
      _body = value;
    }
    
    /**
     * the url of the request 
     */
    public function get url():String  { return _url;  }
    /**
     * @private
     */
    public function set url(value:String):void
    {
      _url = value;
    }
    
    /**
     * the http method of the request.
     * @see flash.net.URLRequestMethod
     */
    public function get method():String { return _method; }
    /**
     * @private
     */
    public function set method(value:String):void
    {
      _method = value;
    }
    
    /**
     * the query parameters. a key/value object 
     */
    public function get queryParams():Object  { return _queryParams;  }
    /**
     * @private
     */
    public function set queryParams(value:Object):void
    {
      _queryParams = value;
    }
    
    /**
     * the response <code>Class</code> type for <code>JSON</code> conversion.<br>
     * if <code>NUll</code>, the response will be the original response body as is. 
     */
    public function get classResponse():Class { return _classResponse;  }
    /**
     * @private
     */
    public function set classResponse(value:Class):void
    {
      _classResponse = value;
    }
    
  }
  
}
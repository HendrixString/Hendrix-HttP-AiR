package com.hendrix.http.core
{

  import com.hendrix.http.Request;
  import com.hendrix.http.common.error.HttpError;
  import com.hendrix.http.common.mime.MimeHeader;
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
   * <code>HTTP</code> Request carrier
   * 
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
     * process an <code>HTTP</code> Request object
     * 
     * @param $request the <code>Request</code> object
     * 
     * @see com.hendrix.http.Request
     */
    public function HttpRequestProcess($request:Request = null, $id: String  = null, $priorityKey: Object = 10)
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
     * process the <code>HTTP</code> request
     * 
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

    /**
     * @inheritDoc 
     * 
     */
    override public function dispose():void
    {
      super.dispose();

      stop();

      _ur = null;
      _ul = null;
      _uv = null;

      dataResponse  = null;
    }

    /**
     * @inheritDoc 
     * 
     */
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
     * here prepare the <code>HTTP</code> request
     *
     */
    protected function prepareRequest():void
    {
      _ur.url                     = _request.url;
      _ur.method                  = _request.method;
      _ur.requestHeaders          = _request.headers;

      if(_request.body) {
        _ur.data                  = _request.body.content;

        var contentType:  String  = _request.body.contentType;
        var arr:          Array   = null;

        if(contentType) {
            arr                   = contentType.split(":");

          if(arr.length > 2)
            throw new HttpError("Malformed Content Type!!! more than one header was inserted was inserted!");
          else if(arr.length == 2)
            contentType           = arr[1] as String;

          _ur.contentType         = contentType;
        }
      }

      if(_request.queryParams) {
        _ur.url                  += NetUtils.ObjectToQueryString(_request.queryParams);
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

     // var i:String = (dataResponse as ByteArray).toString();
      
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
      
      if(_request.flagReturnRequestAsResponse)
        notifyComplete(_request);
      else
        notifyComplete(res);
    }

    protected function ul_onError(event:IOErrorEvent = null):void
    {
      if(event != null) {
        trace(event.currentTarget.data);
  
        dataResponse  = (event.currentTarget as URLLoader).data;
      }

      if(_request.flagReturnRequestAsResponse)
        notifyError(_request);
      else
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
package com.hendrix.http.builders
{
  import com.hendrix.http.Request;
  import com.hendrix.http.RequestBody;
  
  import flash.net.URLRequestHeader;
  import flash.net.URLRequestMethod;
  
  /**
   * HTTP Request builder.
   * @author Tomer Shalev
   * @see com.hendrix.http.Request
   */
  public class RequestBuilder
  {
    private var _request: Request = null;
    
    /**
     * HTTP Request builder.
     * @param request you can specify a <code>Request</code> refernce to apply the building on. otherwise, a new instance will be made.
     * @see com.hendrix.http.Request
     */
    public function RequestBuilder(request:Request = null)
    {
      _request = request ? request : new Request();
    }
    
    /**
     * build the request 
     * @return <code>Request</code> reference or new instance
     */
    public function build():Request
    {
      return _request;
    }
    
    /**
     * @copy com.hendrix.http.Request.classResponse 
     * 
     */
    public function responseClass(cls:Class):RequestBuilder
    {
      _request.classResponse = cls;
      
      return this;
    }
    
    /**
     * add a new Header to the request. allows multiple value for header.
     * @param name the name of the header
     * @param value the value of the header
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function addHeader(name:String, value:String):RequestBuilder
    {
      _request.headers.push(new URLRequestHeader(name, value));
      
      return this;
    }
    
    /**
     * make only one header instance of type name 
     * @param name the name of the header
     * @param value the only value for the header
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function header(name:String, value:String):RequestBuilder
    {
      var count: uint             = _request.headers.length
      
      var urh:   URLRequestHeader = null;
      
      for(var ix:uint = 0; ix < count; ix++) {
        urh = _request.headers[ix] as URLRequestHeader;
        if(urh.name == name)
          urh.name                = null;
      }
      
      _request.headers.push(new URLRequestHeader(name, value));
      
      return this;
    }
    
    /**
     * apply a new query parameters object 
     * @param q a key/value Object
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function query(q:Object):RequestBuilder
    {
      _request.queryParams = q;
      
      return this;
    }
    
    /**
     * add a new key/value into the query parameters 
     * @param key the key
     * @param value the value
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function addQuery(key:String, value:String):RequestBuilder
    {
      _request.queryParams[key] = value;
      
      return this;
    }
    
    /**
     * the url of the request
     * @return <code>RequestBuilder</code> reference
     */
    public function url(url:String):RequestBuilder
    {
      _request.url = url;
      
      return this;
    }
    
    /**
     * specify <code>GET</code> method
     * @return <code>RequestBuilder</code> reference
     */
    public function GET():RequestBuilder
    {
      _request.method = URLRequestMethod.GET;
      return this;
    }
    
    /**
     * specify <code>PUT</code> method
     * @param body the request body
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function PUT(body:RequestBody):RequestBuilder
    {
      _request.method = URLRequestMethod.PUT;
      _request.body   = body;
      return this;
    }
    
    /**
     * specify <code>DELETE</code> method
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function DELETE():RequestBuilder
    {
      _request.method = URLRequestMethod.DELETE;
      return this;
    }
    
    /**
     * specify <code>HEAD</code> method
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function HEAD():RequestBuilder
    {
      _request.method = URLRequestMethod.HEAD;
      return this;
    }
    
    /**
     * specify <code>OPTIONS</code> method
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function OPTIONS():RequestBuilder
    {
      _request.method = URLRequestMethod.OPTIONS;
      return this;
    }
    
    /**
     * specify <code>POST</code> method
     * @param body the request body
     * @return <code>RequestBuilder</code> reference
     * 
     */
    public function POST(body:RequestBody = null):RequestBuilder
    {
      _request.method = URLRequestMethod.POST;
      _request.body   = body;
      
      return this;
    }
    
  }
  
}
package com.hendrix.http
{
  import com.hendrix.http.utils.DiskUtils;
  
  import flash.filesystem.File;
  import flash.utils.ByteArray;
  
  /**
   * a Request Body class. can a body or a part body.
   * @author Tomer Shalev
   * 
   */
  public class RequestBody
  {
    private var _contentType: String    = null;
    private var _content:     ByteArray = null;
    
    /**
     * a Request Body class. can a body or a part body.
     */
    public function RequestBody()
    {
      _content = new ByteArray();
    }
    
    /**
     * create a body with a content/mime type 
     * @param content <code>ByteArray, File, String</code> (or anything that has <code>.toString()</code>)
     * @param contentType content type formatted as <code>MIME</code> headers
     * @return a new request body
     * 
     */
    public static function create(content:Object, contentType:String = null):RequestBody
    {
      var rb:RequestBody = new RequestBody();
      
      if(content is ByteArray) {
        (content as ByteArray).position = 0;
        rb.content.writeBytes(content as ByteArray);
      }
      else if(content is File) {
        rb.content.writeBytes(DiskUtils.loadFile(content));
      }
      else {
        rb.content.writeUTFBytes(content.toString());
      }
      
      rb.contentType  = contentType;
      
      return rb;
    }
    
    /**
     * the mime type formatted as mime headers with line breaks
     */
    public function get contentType():String  { return _contentType;  }
    /**
     * @private
     */
    public function set contentType(value:String):void
    {
      _contentType = value;
    }
    
    /**
     * the body 
     */
    public function get content():ByteArray { return _content;  }
    /**
     * @private
     */
    public function set content(value:ByteArray):void
    {
      _content = value;
    }
    
  }
  
}
package com.hendrix.http.builders
{
  import com.hendrix.http.Mime;
  import com.hendrix.http.common.mime.ContentDescription;
  import com.hendrix.http.common.mime.ContentDisposition;
  import com.hendrix.http.common.mime.ContentID;
  import com.hendrix.http.common.mime.ContentLocation;
  import com.hendrix.http.common.mime.ContentTransferEncoding;
  import com.hendrix.http.common.mime.ContentType;
  
  /**
   * <code>MIME Builder</code> pattern for faster constructions of <code>MIME</code> Header
   * @author Tomer Shalev
   * 
   */
  public class MimeBuilder
  {
    private var _mime:Mime = null;
    
    /**
     * <code>MIME Builder</code> pattern for faster constructions of <code>MIME</code> Header
     */
    public function MimeBuilder(mime:Mime = null)
    {
      _mime = mime ? mime : new Mime();
    }
    
    /**
     * builds the MIME object and return it; 
     */
    public function build():Mime
    {
      return _mime;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentID.ContentID()
     */
    public function contentID(value:String, ...params):MimeBuilder 
    {
      _mime.content_id = new ContentID(value, params);
      
      return this;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentLocation.ContentLocation()
     */
    public function contentLocation(value:String, ...params):MimeBuilder 
    {
      _mime.content_location = new ContentLocation(value, params);
      
      return this;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentDescription.ContentDescription()
     */
    public function contentDescription(value:String, ...params):MimeBuilder 
    {
      _mime.content_description = new ContentDescription(value, params);
      
      return this;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentDisposition.ContentDisposition()
     */
    public function contentDisposition(value:String, ...params):MimeBuilder 
    {
      _mime.content_disposition = new ContentDisposition(value, params);
      
      return this;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentType.ContentType()
     */
    public function contentType(type:String, subType:String = "", ...params):MimeBuilder 
    {
      _mime.content_type = new ContentType(type, subType, params);
      
      return this;
    }
    
    /**
     * @copy com.hendrix.http.common.mime.ContentTransferEncoding.ContentTransferEncoding()
     */
    public function contentTransferEncoding(value:String, ...params):MimeBuilder 
    {
      _mime.content_transfer_encoding = new ContentTransferEncoding(value, params);
      
      return this;
    }
    
  }
  
}
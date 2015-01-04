package com.hendrix.http
{
  import com.hendrix.http.common.mime.ContentDescription;
  import com.hendrix.http.common.mime.ContentDisposition;
  import com.hendrix.http.common.mime.ContentID;
  import com.hendrix.http.common.mime.ContentLocation;
  import com.hendrix.http.common.mime.ContentTransferEncoding;
  import com.hendrix.http.common.mime.ContentType;
  import com.hendrix.http.common.mime.MimeVersion;
  
  /**
   * a MIME helper class. most programmers will usually just write MIME headers as text.
   * but this class may be used by programmers who are not proficient at HTTP as a tool,
   * both to study and implement.
   * @author Tomer Shalev
   * 
   */
  public class Mime
  {
    private var _version:                   MimeVersion             = null ;
    private var _content_type:              ContentType             = null;
    private var _content_disposition:       ContentDisposition      = null;
    private var _content_transfer_encoding: ContentTransferEncoding = null;
    private var _content_id:                ContentID               = null;
    private var _content_description:       ContentDescription      = null;
    private var _content_location:          ContentLocation         = null;
    
    /**
     * a MIME helper class. most programmers will usually just write MIME headers as text.
     * but this class may be used by programmers who are not proficient at HTTP as a tool,
     * both to study and implement.
     */
    public function Mime()
    {
    }
    
    public function create():String
    {
      return toString();
    }
    
    public function toString():String
    {
      var strMime:String = new String();
      
      if(_version)
        strMime += _version.toString() + "\n";
      
      if(_content_type)
        strMime += _content_type.toString() + "\n";
      
      if(_content_disposition)
        strMime += _content_disposition.toString() + "\n";
      
      if(_content_transfer_encoding)
        strMime += _content_transfer_encoding.toString() + "\n";
      
      if(_content_id)
        strMime += _content_id.toString() + "\n";
      
      if(_content_description)
        strMime += _content_description.toString();
      
      return strMime;
    }
    
    /**
     * The presence of this header indicates the message is MIME-formatted. The value is typically "1.0" 
     */
    public function get version():MimeVersion
    {
      return _version;
    }
    
    /**
     * @private
     */
    public function set version(value:MimeVersion):void
    {
      _version = value;
    }
    
    /**
     * This header indicates the Internet media type of the message content, consisting of a type and subtype 
     */
    public function get content_type():ContentType
    {
      return _content_type;
    }
    
    /**
     * @private
     */
    public function set content_type(value:ContentType):void
    {
      _content_type = value;
    }
    
    /**
     * The content-disposition header field was added in RFC 2183 to specify the presentation style 
     */
    public function get content_disposition():ContentDisposition
    {
      return _content_disposition;
    }
    
    /**
     * @private
     */
    public function set content_disposition(value:ContentDisposition):void
    {
      _content_disposition = value;
    }
    
    /**
     * Each MIME part may contain a header that specifies whether the part was processed for transfer and how the body of the message part is currently represented. 
     */
    public function get content_transfer_encoding():ContentTransferEncoding
    {
      return _content_transfer_encoding;
    }
    
    /**
     * @private
     */
    public function set content_transfer_encoding(value:ContentTransferEncoding):void
    {
      _content_transfer_encoding = value;
    }
    
    /**
     * The Content-ID header associates a unique ID with a MIME part 
     */
    public function get content_id():ContentID
    {
      return _content_id;
    }
    
    /**
     * @private
     */
    public function set content_id(value:ContentID):void
    {
      _content_id = value;
    }
    
    /**
     * The Content-Description header briefly describes the body the part contains. RFC 2045 defines the Content-Description header in section 8 (p. 27)
     */
    public function get content_description():ContentDescription
    {
      return _content_description;
    }
    
    /**
     * @private
     */
    public function set content_description(value:ContentDescription):void
    {
      _content_description = value;
    }
    
    /**
     * The Content-Location header associates a URI with the part. In Example 32, the Content-Location header contains the value http://roguewave.example/simple.txt. Other parts in the message can reference the part using the value of the Content-Location header. The URI in the header is only used by other parts within the same message. Therefore, the URI need not be world-unique or indicate an actual resource on the Internet. RFC 2557 defines the Content-Location header in section 4.2 (p. 7).
     */
    public function get content_location():ContentLocation
    {
      return _content_location;
    }
    
    /**
     * @private
     */
    public function set content_location(value:ContentLocation):void
    {
      _content_location = value;
    }
    
  }
  
}
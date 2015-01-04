package com.hendrix.http.common.mime
{
  /**
   * <b>Content-Type</b> Header.<br>
   * The Content-Type header declares the original file format of the part body<br>
   * RFC 2045 defines the Content-Type header in section 5 (p. 10). RFC 2046 discusses specific Content-Type values.
   */
  final public class ContentType extends MimeHeader
  {
    private var _type:    String;
    private var _subType: String;
    
    /**
     * <b>Content-Type</b> Header.<br>
     * The Content-Type header declares the original file format of the part body<br>
     * RFC 2045 defines the Content-Type header in section 5 (p. 10). RFC 2046 discusses specific Content-Type values.
     * @param type the Mime main type
     * @param subType the Mime main subtype
     * @param params extra MIME header parameters
     */
    public function ContentType(type:String, subType:String, ...params)
    {
      _type           = type;
      _subType        = subType;
      
      var val:String  = (_type.indexOf("/") == -1) ? (_type + "/" + _subType) : _type;
      
      super(MimeHeader.Content_Type, val, params);
    }
    
  }
  
}
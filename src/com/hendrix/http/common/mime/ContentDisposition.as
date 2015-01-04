package com.hendrix.http.common.mime
{
  /**
   * Content-Disposition Header, see [RFC2183] for more values and parameters.<br>
   * The content-disposition header field was added in RFC 2183 to specify the presentation style
   */
  public class ContentDisposition extends MimeHeader
  {
    /**
     * displayed automatically 
     */
    static public const inline:String = "inline"; 
    /**
     * user controlled display 
     */
    static public const attachment:String = "attachment"; 
    /**
     * process as form response 
     */
    static public const form_data:String = "form-data"; 
    
    /**
     * Content-Disposition Header, see [RFC2183] for more values and parameters.<br>
     * The content-disposition header field was added in RFC 2183 to specify the presentation style
     * @param value of the header
     * @param params extra MIME header parameters
     */
    public function ContentDisposition(value:String="", ...params)
    {
      super(MimeHeader.Content_Disposition, value, params);
    }
    
  }
  
}
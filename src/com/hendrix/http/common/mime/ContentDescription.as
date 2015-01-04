package com.hendrix.http.common.mime
{
  /**
   * Content-Description Header.<br>
   * The Content-Description header briefly describes the body the part contains,<br>
   * RFC 2045 defines the Content-Description header in section 8 (p. 27).
   */
  public class ContentDescription extends MimeHeader
  {
    /**
     * Content-Description Header.<br>
     * The Content-Description header briefly describes the body the part contains,<br>
     * RFC 2045 defines the Content-Description header in section 8 (p. 27).
     * @param value it's value
     * @param params extra MIME header parameters
     */
    public function ContentDescription(value:String="", ...params)
    {
      super(MimeHeader.Content_Description, value, params);
    }
    
  }
  
}
package com.hendrix.http.common.mime
{
  /**
   * Content-Location Header.<br>
   * The Content-Location header associates a URI with the part,<br>
   * RFC 2557 defines the Content-Location header in section 4.2 (p. 7).
   */
  public class ContentLocation extends MimeHeader
  {
    /**
     * Content-Location Header.<br>
     * The Content-Location header associates a URI with the part,<br>
     * RFC 2557 defines the Content-Location header in section 4.2 (p. 7).
     * @param value the header's value
     * @param params extra MIME header parameters
     * 
     */
    public function ContentLocation(value:String="", ...params)
    {
      super(MimeHeader.Content_Location, value, params);
    }
  }
}
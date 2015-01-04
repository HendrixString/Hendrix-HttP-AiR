package com.hendrix.http.common.mime
{
  /**
   * Content-ID Header.<br>
   * The Content-ID header associates a unique ID with a MIME part,<br>
   * RFC 2045 defines the Content-ID header in section 7 (p. 26).
   */
  public class ContentID extends MimeHeader
  {
    /**
     * Content-ID Header.<br>
     * The Content-ID header associates a unique ID with a MIME part,<br>
     * RFC 2045 defines the Content-ID header in section 7 (p. 26).
     * @param value it's value
     * @param params extra MIME header parameters
     */
    public function ContentID(value:String="", ...params)
    {
      super(MimeHeader.Content_ID, value, params);
    }
  }
}
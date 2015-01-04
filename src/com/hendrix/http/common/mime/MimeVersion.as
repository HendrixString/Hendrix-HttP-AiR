package com.hendrix.http.common.mime
{
  /**
   * A MIME message must contain a header with information on the version of the MIME format that the message follows. The name of this header is -MIME-Version. The value of the header indicates the revision of the MIME specification the message follows. The MIME package supports MIME version 1.0, so the value of this header in Example 32 is 1.0. Although the MIME package allows any version value, the only value defined by the MIME specifications is 1.0.The eader is only required for a top-level MIME message. Nested parts within a multipart message need not include the MIME-Version header.RFC 2045 defines the Mime-Version header in Section 4 (p. 8). 
   */
  public class MimeVersion extends MimeHeader
  {
    /**
     * A MIME message must contain a header with information on the version of the MIME format that the message follows. The name of this header is -MIME-Version. The value of the header indicates the revision of the MIME specification the message follows. The MIME package supports MIME version 1.0, so the value of this header in Example 32 is 1.0. Although the MIME package allows any version value, the only value defined by the MIME specifications is 1.0.The eader is only required for a top-level MIME message. Nested parts within a multipart message need not include the MIME-Version header.RFC 2045 defines the Mime-Version header in Section 4 (p. 8). 
     */
    public function MimeVersion()
    {
      super(MimeHeader.MIME_Version, "1.0");
    }
  }
}
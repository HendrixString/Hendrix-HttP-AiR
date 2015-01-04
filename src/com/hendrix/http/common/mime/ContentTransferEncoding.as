package com.hendrix.http.common.mime
{
  /**
   * <b>Content-Transfer-Encoding</b> Header.<br>
   * Each MIME part may contain a header that specifies whether the part was processed for transfer and how the body of the message part is currently represented. The field name of this header is Content-Transfer-Encoding. <br>
   * RFC 2045 defines the Content-Transfer-Encoding header in section 6 (p. 14).
   * some valid values are<code>
   * <li>ContentTransferEncoding.Enc_7bit
   * <li>ContentTransferEncoding.Enc_quoted_printable
   * <li>ContentTransferEncoding.Enc_base64
   * <li>ContentTransferEncoding.Enc_8bit
   * <li>ContentTransferEncoding.Enc_binary 
   */
  public class ContentTransferEncoding extends MimeHeader
  {
    /**
     * up to 998 octets per line of the code range 1..127 with CR and LF (codes 13 and 10 respectively) only allowed to appear as part of a CRLF line ending. This is the default value. 
     */
    static public const Enc_7bit:String = "7bit";
    /**
     * used to encode arbitrary octet sequences into a form that satisfies the rules of 7bit. Designed to be efficient and mostly human readable when used for text data consisting primarily of US-ASCII characters but also containing a small proportion of bytes with values outside that range. 
     */
    static public const Enc_quoted_printable:String = "quoted-printable";
    /**
     * used to encode arbitrary octet sequences into a form that satisfies the rules of 7bit. Designed to be efficient for non-text 8 bit and binary data. Sometimes used for text data that frequently uses non-US-ASCII characters. Suitable for use with SMTP servers that support the 8BITMIME SMTP extension (RFC 6152): 
     */
    static public const Enc_base64:String = "base64";
    /**
     * up to 998 octets per line with CR and LF (codes 13 and 10 respectively) only allowed to appear as part of a CRLF line ending. Suitable for use with SMTP servers that support the BINARYMIME SMTP extension (RFC 3030):
     */
    static public const Enc_8bit:String = "8bit";
    /**
     * any sequence of octets. 
     */
    static public const Enc_binary:String = "binary";
    
    /**
     * <b>Content-Transfer-Encoding</b> Header.<br>
     * Each MIME part may contain a header that specifies whether the part was processed for transfer and how the body of the message part is currently represented. The field name of this header is Content-Transfer-Encoding. <br>
     * RFC 2045 defines the Content-Transfer-Encoding header in section 6 (p. 14).
     * @param value it's value
     * @param params extra MIME header parameters
     * some valid values are<code>
     * <li>ContentTransferEncoding.Enc_7bit
     * <li>ContentTransferEncoding.Enc_quoted_printable
     * <li>ContentTransferEncoding.Enc_base64
     * <li>ContentTransferEncoding.Enc_8bit
     * <li>ContentTransferEncoding.Enc_binary 
     * 
     */
    public function ContentTransferEncoding(value:String, ...params)
    {
      super(MimeHeader.Content_Transfer_Encoding, value, params);
    }
    
  }
  
}
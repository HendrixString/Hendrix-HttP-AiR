package com.hendrix.http.builders
{
  import com.hendrix.http.RequestBody;
  
  import flash.utils.ByteArray;
  
  /**
   * a simple multi part builder. use it for <code>multipart</code> content types,
   * where the request body is composed of parts (bodies of their own)
   * @author Tomer Shalev
   */
  public class MultiPartBuilder
  {
    /**
     * The "mixed" subtype of "multipart" is intended for use when the body
     * parts are independent and need to be bundled in a particular order. Any
     * "multipart" subtypes that an implementation does not recognize must be
     * treated as being of subtype "mixed".
     */
    public static const MIXED:String = "multipart/mixed";
    
    /**
     * The "multipart/alternative" type is syntactically identical to
     * "multipart/mixed", but the semantics are different. In particular, each
     * of the body parts is an "alternative" version of the same information.
     */
    public static const ALTERNATIVE:String = "multipart/alternative";
    
    /**
     * This type is syntactically identical to "multipart/mixed", but the
     * semantics are different. In particular, in a digest, the default {@code
     * Content-Type} value for a body part is changed from "text/plain" to
     * "message/rfc822".
     */
    public static const DIGEST:String = "multipart/digest";
    
    /**
     * This type is syntactically identical to "multipart/mixed", but the
     * semantics are different. In particular, in a parallel entity, the order
     * of body parts is not significant.
     */
    public static const PARALLEL:String = "multipart/parallel";
    
    /**
     * The media-type multipart/form-data follows the rules of all multipart
     * MIME data streams as outlined in RFC 2046. In forms, there are a series
     * of fields to be supplied by the user who fills out the form. Each field
     * has a name. Within a given form, the names are unique.
     */
    public static const FORM:String = "multipart/form-data";
    
    /**
     * A multipart/related is used to indicate that each message part is a component of an aggregate whole. 
     * It is for compound objects consisting of several inter-related components - proper display cannot be achieved 
     * by individually displaying the constituent parts. The message consists of a root part (by default, the first) 
     * which reference other parts inline, which may in turn reference other parts. Message parts are commonly referenced 
     * by the "Content-ID" part header. The syntax of a reference is unspecified and is instead dictated by the encoding 
     * or protocol used in the part. One common usage of this subtype is to send a web page complete with images in a single message. 
     * The root part would contain the HTML document, and use image tags to reference images stored in the latter parts. Defined in RFC 2387 
     */
    public static const RELATED:String = "multipart/related";
    
    private static const MULTIPART_MARK:  String      = "--";
    private static const LF:              String      = "\r\n";
    
    private var _content:   ByteArray = null;
    private var _type:      String    = RELATED;
    private var _boundary:  String    = "----------196f00b77b968397849367c61a2080";
    
    /**
     * a simple multi part builder. use it for <code>multipart</code> content types,
     * where the request body is composed of parts (bodies of their own)
     * @author Tomer Shalev
     */
    public function MultiPartBuilder()
    {
      _content = new ByteArray();
    }
    
    /**
     * add a part to the request 
     * @param body the body of the part
     * @param mimeHeaders the MIME headers of the part. one can use the <code>MimeBuilder</code> class to generate that string. decided to go here with string for ease of use of programmers.
     * @return <code>MultiPartBuilder</code> reference
     * @see com.hendrix.http.builders.MimeBuilder
     */
    public function addPart(body:RequestBody, mimeHeaders:String = ""):MultiPartBuilder
    {
      var body_contentType: String = body.contentType ? body.contentType + LF : "";
      
      _content.writeUTFBytes(MULTIPART_MARK + _boundary + LF + body_contentType + mimeHeaders + LF + LF);// + text + LF
      body.content.position        = 0;
      
      _content.writeBytes(body.content, 0, body.content.length);
      _content.writeUTFBytes(LF);
      
      return this;
    }
    
    /**
     * multipart type of the whole request
     * @param $type some well accepted values are:
     * <li><code>MultiPartBuilder.FORM
     * <li>MultiPartBuilder.MIXED
     * <li>MultiPartBuilder.RELATED
     * <li>MultiPartBuilder.ALTERNATIVE
     * <li>MultiPartBuilder.DIGEST
     * <li>MultiPartBuilder.PARALLEL
     * @return <code>MultiPartBuilder</code> reference
     * 
     */
    public function type($type:String):MultiPartBuilder
    {
      _type = $type;
      
      return this;
    }
    
    /**
     * build the request body 
     * @return <code>RequestBody</code> instance
     * 
     */
    public function build():RequestBody
    {
      _content.writeUTFBytes(MULTIPART_MARK + _boundary + MULTIPART_MARK + LF);
      var res:String = _content.toString();
      return RequestBody.create(_content, _type + ";boundary=" + _boundary);
    }
    
    /**
     * the boundary of the parts 
     */
    public function get boundary():String
    {
      return _boundary;
    }
    
    /**
     * @private
     */
    public function set boundary(value:String):void
    {
      _boundary = value;
    }
    
  }
  
}
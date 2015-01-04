package com.hendrix.http.common.mime
{
  import com.hendrix.http.common.error.HttpError;
  
  /**
   * Mime Header 
   * @author Tomer Shalev
   * 
   */
  public class MimeHeader
  {
    public static const MIME_Version:               String = "MIME-Version";
    public static const Content_Type:               String = "Content-Type";
    public static const Content_Transfer_Encoding:  String = "Content-Transfer-Encoding";
    public static const Content_Description:        String = "Content-Description";
    public static const Content_ID:                 String = "Content-ID";
    public static const Content_Location:           String = "Content-Location";
    public static const Content_Disposition:        String = "Content-Disposition";
    
    protected var _name:        String;
    protected var _value:       String;
    protected var _parameters:  String = "";
    
    /**
     * Mime Header 
     * @param name the name of the MIME header
     * @param value it's value
     * @param params extra MIME header parameters
     * @throws com.hendrix.http.common.error.HttpError
     */
    public function MimeHeader(name:String = "", value:String = "", ...params)
    {
      _name             = name;
      _value            = value;
      
      var cParmas: uint = params[0].length;
      
      if(cParmas%2 == 1)
        throw new HttpError("some parameter key is missing a value");
      
      for(var ix:uint = 0; ix <= cParmas - 2; ix += 2)
      {
        addParameter(params[0][ix], params[0][ix + 1]); 
      }
      
    }
    
    /**
     * ass mime type parameter. please follow [RFC 2183] 
     * @param param
     * @param value
     * 
     */
    public function addParameter(param:String, value:String):void
    {
      _parameters += "; " + param + "=" + value;
    }
    
    public function toString():String
    {
      return _name + ":" + _value + _parameters;
    }
    
    
    /**
     * the name of the Mime Type 
     */
    public function get name():String
    {
      return _name;
    }
    
    /**
     * the value of the header 
     */
    public function get value():String
    {
      return _value;
    }
    
    /**
     * @private
     */
    public function set value(value:String):void
    {
      _value = value;
    }
    
  }
  
}
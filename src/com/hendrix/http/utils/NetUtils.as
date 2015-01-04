package com.hendrix.http.utils
{
  import flash.utils.Dictionary;
  
  public class NetUtils
  { 
    ////sdsss
    static public function dictionaryToQuery(dic:Dictionary):String
    {
      var key:    String      = null;
      var value:  String      = null;
      var res:    String      = "?";
      
      if(dic == null)
        return "";
      
      for (var k:String in dic) {
        value                 = dic[k];
        key                   = k;
        
        res                  += key + "=" + value + "&";
      }
      
      return res.substring(0, res.length - 1);
    }
    
    static public function ObjectToQueryString(dic:Object):String
    {
      var key:    String      = null;
      var value:  String      = null;
      var res:    String      = "?";
      
      if(dic == null)
        return "";
      
      for (var k:String in dic) {
        value                 = dic[k].toString();
        key                   = k;
        
        res                  += key + "=" + value + "&";
      }
      
      return res.substring(0, res.length - 1);
    }
    
    public function NetUtils()
    {
    }
    
  }
  
}

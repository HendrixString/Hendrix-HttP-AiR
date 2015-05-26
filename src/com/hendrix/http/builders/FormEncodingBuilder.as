package com.hendrix.http.builders
{
  import com.hendrix.http.RequestBody;
  
  /**
   * a simple form encoding builder. use it for <code>application/x-www-form-urlencoded</code> content type,
   * where the request body is a query string.
   * @author Tomer Shalev
   */
  public class FormEncodingBuilder
  {
    private var _query: String = null;
    
    /**
     * a simple form encoding builder. use it for <code>application/x-www-form-urlencoded</code>,
     * where the request body is a query string.
     */
    public function FormEncodingBuilder()
    {
      _query = new String();
    }
    
    /**
     * add a query part in the body of the request 
     * @param name name of part
     * @param value value of part
     * @return a form encoding builder 
     */
    public function add(name:String, value:String):FormEncodingBuilder
    {
      if(_query.length > 0)
        _query += "&";
      
      _query += name + "=" + value; 
      
      return this;
    }
    
    /**
     * build the request body
     * @return request <code>RequestBody</code> instance
     */
    public function build():RequestBody
    {
      return RequestBody.create(_query, "application/x-www-form-urlencoded");
    }
    
  }
  
}
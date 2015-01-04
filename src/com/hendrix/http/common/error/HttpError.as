package com.hendrix.http.common.error
{
  /**
   * a Hendrix HTTP Error 
   * @author Tomer Shalev
   */
  public class HttpError extends Error
  {
    static private const MESSAGE_PREFIX:String = "Hendrix HttpError:: ";
    
    public function HttpError(message:*="", id:*=0)
    {
      super(MESSAGE_PREFIX + message, id);
    }
  }
}
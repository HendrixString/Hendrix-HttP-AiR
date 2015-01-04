package com.hendrix.http.utils
{
  import flash.filesystem.File;
  import flash.filesystem.FileMode;
  import flash.filesystem.FileStream;
  import flash.utils.ByteArray;
  
  public class DiskUtils
  {
    static public function loadFile(src:Object):ByteArray
    {
      var fs: FileStream  = new FileStream();
      var f:  File        = src is File ? src as File : new File(src as String);
      
      var ba: ByteArray   = new ByteArray();
      
      try {
        fs.open(f, FileMode.READ);
        fs.readBytes(ba, 0, fs.bytesAvailable);
      }
      catch(err:Error){
        
      }
      
      return ba;
    }
    
    public function DiskUtils()
    {
    }
  }
}
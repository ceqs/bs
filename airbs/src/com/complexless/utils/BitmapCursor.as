package components
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.ui.MouseCursorData;

   public class BitmapCursor
   {
	 
	  [Embed(source="assets/cursors/cursor_win_crosshair.png")]
	  private var crosshairCursor:Class;
      
      private var _active:Boolean;
      private var _type:int;
      private var _color:int;
      private var _large:Boolean;
      private var _registered:Array;
         
      public function BitmapCursor()
      {
         this._active = false;
         this._type = 0;
         this._color = 0;
         this._large = true;
         this._registered = new Array(true, false, false, false, false);
      }
      
      public function set type(type:int):void
      {
         if ((type >= 0) && (type <= 4) && (this._type = type)) {
            this._type = type;
            selectCursor();
         }
      }
      
      public function get type():int
      {
         return this._type;
      }
    
      public function set color(color:uint):void
      {
         if ((color >= 0) && (color <= 0xffffff) && (this._color != color))
         {
            var currType:int = this._type;
            this._color = color;
            unregisterCursors();
            this._type = currType;
            selectCursor();
         }
      }
      
      public function get color():uint
      {
          return this._color;  
      }
      
      public function set large(large:Boolean):void
      {
         if (this._large != large)
         {
            var currType:int = this._type;
            this._large = large;
            unregisterCursors();
            this._type = currType;
            selectCursor();
         }      
      }

      public function get large():Boolean
      {
         return this._large;  
      }
      
      public function set active(active:Boolean):void
      {
         if (this._active != active)
         {
            this._active = active;
            selectCursor();
         }
      }
      
      public function get active():Boolean
      {
         return this._active;
      }
      
      private function selectCursor():void
      {
         var i:int = this._active ? this._type : 0;
         registerCursor(i);
         Mouse.cursor = getName(i);
      }
      
      private function registerCursor(i:int):void
      {
         if (!this._registered[i])
         {
            var bitmapData:Vector.<BitmapData> = new Vector.<BitmapData>(1, true);
            var bitmap:Bitmap =new crosshairCursor();
            var mouseCursorData:MouseCursorData = new MouseCursorData();
            bitmapData[0] = bitmap.bitmapData;    
            if (this._color != 0)
            {
               for (var x:int = 0; x < bitmap.bitmapData.width; x++) 
               {
                  for (var y:int = 0; y < bitmap.bitmapData.height; y++) 
                  {
                     var pixelValue:uint = bitmap.bitmapData.getPixel32(x, y);
                     if (pixelValue > 0xffffff) {
                        bitmap.bitmapData.setPixel(x, y, this._color);
                     }
                  }
               }
            }
            mouseCursorData.hotSpot = new Point((bitmap.bitmapData.width - 1) / 2, (bitmap.bitmapData.height - 1) / 2);
            mouseCursorData.data = bitmapData;
            Mouse.registerCursor(getName(i), mouseCursorData);
            this._registered[i] = true;         
         }
      }
      
      private function unregisterCursors():void
      {
         for (var i:int = 1; i < this._registered.length; i++) 
         {
            if (this._registered[i])
            {
               if (i == this._type)
               {
                  type = 0;
               }
               Mouse.unregisterCursor(getName(i));
               this._registered[i] = false;            }
         }
      }
            
      private function getName(i:int):String
      {
         return i == 0 ? flash.ui.MouseCursor.AUTO : '_cursor_' + (this._large ? '30_' : '20_') + i.toString();
      }
      
     
   }
}
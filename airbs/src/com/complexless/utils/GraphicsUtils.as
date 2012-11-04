package com.complexless.utils
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	import mx.graphics.IStroke;
	
	public class GraphicsUtils
	{
		public static function _drawDashedLine(target:UIComponent, stroke:IStroke, x:Number, y:Number):void
		{
			var rc:Rectangle = target.getVisibleRect();
			trace(rc);
			stroke.apply(target.graphics, rc, new Point(rc.left,rc.top));
			target.graphics.lineTo(x, y);
		}
		
		public static function drawDashedPolyLine(target:UIComponent, stroke:IStroke, points:Array):void
		{
			if(points.length == 0)
				return;
			
			var prev:Object = points[0];
										
			target.graphics.moveTo(prev.x, prev.y);
			for(var i:int = 1; i < points.length; i++)
			{
				var current:Object = points[i];
				_drawDashedLine(target, stroke, current.x, current.y);
				prev = current;
			}
		}
	}
}
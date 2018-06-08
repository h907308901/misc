package  {
	
	import flash.display.MovieClip;
	
	public class clipArrow extends MovieClip {
		
		public function clipArrow(ox:int, oy:int, ex:int, ey:int) {
			var w:int, h:int;
			var len:Number, rad:Number, deg:Number;
			w = ex - ox;
			h = ey - oy;
			len = Math.sqrt(w * w + h * h);
			rad = Math.atan2(h, w);
			deg = rad * 180 / Math.PI;
			this.arrowTail.x = ox;
			this.arrowTail.y = oy;
			this.arrowTail.width = len;
			this.arrowTail.rotation = deg;
			this.arrowHead.x = ex - this.arrowHead.width * Math.cos(rad) + this.arrowHead.height / 2 * Math.sin(rad);
			this.arrowHead.y = ey - this.arrowHead.width * Math.sin(rad) - this.arrowHead.height / 2 * Math.cos(rad);
			this.arrowHead.rotation = deg;
		}
		
	}
	
}

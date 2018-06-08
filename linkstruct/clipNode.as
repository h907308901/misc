package  {
	
	import flash.display.MovieClip;
	
	public class clipNode extends MovieClip {
		
		private var _boxes:Array;
		
		public function clipNode(values:Array) {
			_boxes = new Array(values.length);
			var _newx:int = 0;
			for (var i:int = 0; i < values.length; i++) {
				_boxes[i] = new clipBox();
				_boxes[i].setText(values[i]);
				_boxes[i].x = _newx;
				_boxes[i].y = 0;
				addChild(_boxes[i]);
				_newx += _boxes[i].width;
			}
		}
		
		public function getX(i:uint):int {
			return _boxes[i].x + _boxes[i].width / 2;
		}
		
		public function getY(i:uint):int {
			return _boxes[i].y + _boxes[i].height / 2;
		}
		
	}
	
}

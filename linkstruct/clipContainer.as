package  {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.PerspectiveProjection;
	
	public class clipContainer extends MovieClip {
		
		private var _nodes:Array;
		
		public function clipContainer() {
			_nodes = new Array();
		}
		
		public function addNode(values:Array, x:int, y:int):uint {
			var node:clipNode = new clipNode(values);
			node.x = x;
			node.y = y;
			this.addChild(node);
			return _nodes.push(node) - 1;
		}
		
		private function minDistRect(px:int, py:int, rx1:int, rx2:int, ry1:int, ry2:int):Point {
			var p:Point = new Point();
			if (px < rx1) p.x = rx1;
			else if (px > rx2) p.x = rx2;
			else p.x = px;
			if (py < ry1) p.y = ry1;
			else if (py > ry2) p.y = ry2;
			else p.y = py;
			return p;
		}
		
		public function addArrow(ifrom:uint, ifrombox:uint, ito:uint):void {
			var arrow:clipArrow;
			var ox:int, oy:int;
			var x1to:int, x2to:int, y1to:int, y2to:int;
			var p:Point;
			ox = _nodes[ifrom].x + _nodes[ifrom].getX(ifrombox);
			oy = _nodes[ifrom].y + _nodes[ifrom].getY(ifrombox);
			x1to = _nodes[ito].x; x2to = x1to + _nodes[ito].width;
			y1to = _nodes[ito].y; y2to = y1to + _nodes[ito].height;
			p = minDistRect(ox, oy, x1to, x2to, y1to, y2to);
			arrow = new clipArrow(ox, oy, p.x, p.y);
			this.addChild(arrow);
		}
		
		public function addPointer(tagName:String, x:int, y:int, ito:uint):void {
			var po:Point, pe:Point;
			var x1to:int, x2to:int, y1to:int, y2to:int;
			var arrow:clipArrow;
			var tag:clipTag = new clipTag();
			tag.textValue.text = tagName;
			tag.x = x;
			tag.y = y;
			this.addChild(tag);
			x1to = _nodes[ito].x; x2to = x1to + _nodes[ito].width;
			y1to = _nodes[ito].y; y2to = y1to + _nodes[ito].height;
			pe = minDistRect(x + tag.width / 2, y + tag.height / 2, x1to, x2to, y1to, y2to);
			po = minDistRect(pe.x, pe.y, x, x + tag.width, y, y + tag.height);
			pe = minDistRect(po.x, po.y, x1to, x2to, y1to, y2to);
			arrow = new clipArrow(po.x, po.y, pe.x, pe.y);
			this.addChild(arrow);
		}
		
		public function addTag(tagName:String, x:int, y:int):void {
			var tag:clipTag = new clipTag();
			tag.textValue.text = tagName;
			tag.x = x;
			tag.y = y;
			this.addChild(tag);
		}
		
		public function removeAll():void {
			this.removeChildren();
			_nodes = new Array();
		}
		
	}
	
}

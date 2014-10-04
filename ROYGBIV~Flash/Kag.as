package {

	import flash.display.*;
	import flash.events.*;

	public class Kag extends MovieClip {
		var lastDestx:Number= new Number();
		var lastDesty:Number= new Number();
		public function Kag() {
		}
		function goforit() {
			this.x+=lastDestx;
			this.y+=lastDesty;
		}
	}
}
package {

	import flash.display.*;
	import flash.events.*;

	public class Star extends MovieClip {
		var num=Math.random()*6-3;
		
		public function Star() {
			this.addEventListener(Event.ENTER_FRAME, RotateCircle);

		}
		
		function RotateCircle(e:Event) {
this.rotation+=num;

		}
	}
	
}
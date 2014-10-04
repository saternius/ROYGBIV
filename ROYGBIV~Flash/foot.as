package {

	import flash.display.*;
	import flash.events.*;

	public class foot extends MovieClip {
		public function foot() {
			this.addEventListener(Event.ENTER_FRAME, RotateCircle);

		}
		function RotateCircle(e:Event) {
			this.alpha-=.04;
		}
	}
}
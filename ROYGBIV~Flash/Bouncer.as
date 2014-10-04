package {

	import flash.display.*;
	import flash.events.*;

	public class Bouncer extends MovieClip {
		var num=Math.random()*6-3;
		var amp=Math.random()*8;
		var dir:int = new int();
		public function Bouncer() {
			if ((Math.random() > .5) ? true : false) {
				dir=1;
			} else {
				dir=-1;
			}
			this.addEventListener(Event.ENTER_FRAME, RotateCircle);

		}
		function RotateCircle(e:Event) {
			this.rotation+=num;
			this.x+=dir*amp;
			if (x>400) {
				dir=-1;
			}
			if (x<0) {
				dir=1;
			}

		}
	}
}
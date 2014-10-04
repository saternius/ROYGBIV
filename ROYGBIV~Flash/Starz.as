package {

	import flash.display.*;
	import flash.events.*;

	public class Starz extends MovieClip {
		var num=Math.random()*6-3;
		var amp=Math.random()*200+20;
		var dir:int = new int();
		var cov=Math.random()*150+50;

		public function Starz() {
			if((Math.random() > .5) ? true : false){
				dir=1;
			}else{
				dir=-1;
			}
			this.addEventListener(Event.ENTER_FRAME, RotateCircle);

		}
		function RotateCircle(e:Event) {
			this.rotation+=num;
			this.x=dir*(Math.sin(this.y/amp)*amp)+200;

		}
	}
}
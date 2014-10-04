class crowdshot extends MovieClip {
	var speed;
	var drift;
	var type;
	var chain;
	var pos;
	function onLoad() {
		chain = 0;
		pos = Math.floor(Math.random()*2+1);
		type = Math.floor(Math.random()*2+1);
		drift = Math.random()*10;
		speed = 15;
		_y = Math.random()*500+25;
		if(pos==1){
			this._x=-30;
		}
		if(pos==2){
			this._x=580;
		}
	}
	function onEnterFrame() {
		if(pos==1){
			_x+=speed;
		}
		if(pos==2){
			_x-=speed;
		}
		if (this.hitTest(_root.hmshr)) {
			var goflash = _root.attachMovie("flashing", "flashing"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			_root.deathcounter.pain += 1;
			this.removeMovieClip();
		}
		if (_x>600) {
			this.removeMovieClip();
		}
		if (_x<-70) {
			this.removeMovieClip();
		}
		if (_y<-100) {
			this.removeMovieClip();
		}
		if (_y>650) {
			this.removeMovieClip();
		}
		if (type == 1) {
			_y += drift;
		}
		if (type == 2) {
			_y -= drift;
		}
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
	}
}

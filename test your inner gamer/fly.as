class fly extends MovieClip {
	var type;
	var speed;
	function onLoad() {
		speed = Math.random()*3+3;
		type = Math.floor(Math.random()*4+1);
		if (type == 1) {
			this._rotation = 180;
			this._x = Math.random()*550;
			this._y = 250;
		}
		if (type == 2) {
			this._x = Math.random()*550;
			this._y = 150;
		}
		if (type == 3) {
			this._rotation = 180;
			this._x = 200;
			this._y = Math.random()*550;
		}
		if (type == 4) {
			this._x = 400;
			this._y = Math.random()*550;
		}
	}
	function onEnterFrame() {
		if (type == 1) {
			this._rotation -= speed;
		}
		if (type == 2) {
			this._rotation -= speed;
		}
		if (type == 3) {
			this._rotation -= speed;
		}
		if (type == 4) {
			this._rotation -= speed;
		}
		this._rotation -= 3;
		if (this.hitTest(_root.killzone)) {
			this._alpha = 30;
		} else if (this.hitTest(_root.otherzone)) {
			this._alpha = 30;
		} else {
			this._alpha = 100;
		}
		if (_x>750) {
			this.removeMovieClip();
		}
		if (_x<-200) {
			this.removeMovieClip();
		}
		if (_y<-100) {
			this.removeMovieClip();
		}
		if (_y>690) {
			this.removeMovieClip();
		}
		if (this.hitTest(_root.thekill)) {
			_root.flytrap.flied += 1;
			_root.flytrap.slain+=1;
			
			this.removeMovieClip();
		}
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
	}
}

class bs extends MovieClip {
	function onLoad() {
		this._y = 500;
		this._x = Math.random()*500+25;
	}
	function onEnterFrame() {
		this._y -= 4;
		if (_y<-50) {
			this.removeMovieClip();
		}
		if (this.hitTest(_root.rb)) {
			_root.soundMc.sound();
			_root.bb.die();
		}
		if (this.hitTest(_root.bb)) {
			_root.soundMc.stardom();
			_root.rb.life += 100;
			this.removeMovieClip();
		}
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
		
	}
}

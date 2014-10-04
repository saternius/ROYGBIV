class tails extends MovieClip {
	var type;
	function onLoad() {
		this._x = _root.head._x;
		this._y = _root.head._y;
		type = Math.floor(Math.random()*2+1);
	}
	function onEnterFrame() {
		if (type == 1) {
			this._alpha = 0;
			_root.good._alpha = 100;
		}
		if (type == 2) {
			this._alpha = 100;
			_root.bad._alpha = 100;
		}
		if (Key.isToggled(Key.SPACE)) {
			this._visible = false;
		}
		if(_root.hippy._alpha>70){
			this.removeMovieClip();
		}
	}
}

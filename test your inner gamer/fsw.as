class fsw extends MovieClip {
	function onEnterFrame() {
		_root.thekill._x = _root.killzone._x;
		_root.thekill._y = _root.killzone._y;
		if (this._currentframe == this._totalframes) {
			_root.thekill._x = -100;
			_root.thekill._y = -100;
			this.removeMovieClip();
			_root.fs._alpha = 100;
		}
	}
}

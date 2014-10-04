class dedcock extends MovieClip {
	function onLoad() {
		this._alpha = 30;
	}
	function onEnterFrame() {
		this._alpha -= .5;
		if (this._alpha<1) {
			this.removeMovieClip();
		}
		if (_root.fx.effect>3) {
			this.removeMovieClip();
		}
	}
}

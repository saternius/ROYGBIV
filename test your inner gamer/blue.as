class blue extends MovieClip {
	function onEnterFrame() {
		this._alpha=60;
		this._y -= 4;
		if (_y<-50) {
			this.removeMovieClip();
		}
		if(this.hitTest(_root.udead)){
			this._alpha=0;
		}
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
		
		
	}
}

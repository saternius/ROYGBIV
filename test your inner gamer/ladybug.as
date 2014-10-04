class ladybug extends MovieClip {
	var speed;
	var type;
	function onLoad() {
		type = Math.floor(Math.random()*2+1);
		speed = 12;
		_y = Math.random()*320+60;
		if (type == 1) {
			this._x = -90;
		}
		if (type == 2) {
			this._x = 650;
		}
	}
	function onEnterFrame() {
		if (this.hitTest(_root.killzone)) {
			this._alpha=30;
		}else{
			this._alpha=100;
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
		if(type==1){
			this._x+=speed;
			
		}
		if(type==2){
			this._x-=speed;
			this._rotation=180;
		}
		if(this.hitTest(_root.thekill)){
			_root.scorekeeper.score+=10;
			var changeness = _root.attachMovie("dedbug", "dedbug"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			changeness._x=_x;
			changeness._y=_y;
			this.removeMovieClip();
		}
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
	}
}

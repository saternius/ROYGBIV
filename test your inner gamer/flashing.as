class flashing extends MovieClip
{
	function onLoad(){
		this._alpha=100;
		this._x=255;
		this._y=200;
	}

	
	function onEnterFrame(){
		this._alpha-=3;
		if(this._alpha<6){
			this.removeMovieClip();
		}
	}
}
		

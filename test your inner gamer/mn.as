class mn extends MovieClip
{
	var speed;
	
	function onLoad()
	{
		this._rotation=-45;
		speed = -20;
	}
	
	function onEnterFrame()
	{
		_x += speed;
		_y-=speed;

		if(this.hitTest( _root.ship) )
		{
			this.removeMovieClip();
			if(_root.ship.shield._visible==false)
			{
			_root.ship.updateHealth(-20);
			}
		}
		if(_x < 0)
		{
			this.removeMovieClip();
		}
	}
}
class bm extends MovieClip
{
	var speed;
	
	function onLoad()
	{
		speed = -20;
	}
	
	function onEnterFrame()
	{
		_x += speed;

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
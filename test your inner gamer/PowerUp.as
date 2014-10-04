class PowerUp extends MovieClip
{
	var speed;
	var type;

	function onLoad()
	{
		speed = 3;
		type = Math.floor(Math.random()*4+1);
		_x = 650;
		_y = Math.random()*200+50;
	}
	function onEnterFrame()
	{
		if(_root.fx.effect>3){
			this.removeMovieClip();
		}
		_x-= speed;
		_rotation-=7;
		if(this.hitTest(_root.ship))
		{
			if(type==1)
			{
				_root.ship.updateHealth(100-_root.ship.health);
			}
			if(type==2)
			{
				for(var i in _root.ship.enemies)
				{
					_root.ship.enemies[i].explode();
				}
			}
			if(type==3)
			{
				_root.ship.shield._visible=true;
			}
			if(type==4){
				_root.ship.helper+=1;
				_root.missle.width+=55;
				_root.missle.height+=55;
			}
			this.removeMovieClip();
		}
		if(_x<-30)
		{
			this.removeMovieClip();
		}
	}
}
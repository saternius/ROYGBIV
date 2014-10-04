class Mxtlvl extends MovieClip {
	var speed;
	var shootTimer;
	var health;
	var bmshooter;
	var shootTimerB;
	function onLoad() {
		_x = 700;
		_y = 150;
		speed = 1.75;
		shootTimer = 0;
		bmshooter = 0;
		health = 750;
		shootTimerB = 0;
	}
	function onEnterFrame() {
		_x -= speed;
		if (_x<-100) {
			this.removeMovieClip();
		}
		if (this.hitTest(_root.ship)) {
			if (_root.ship.shield._visible == false) {
				_root.ship.gnl();
			}
			explode();
		}
		shootTimer += 2;
		if (shootTimer>30) {
			bmshooter += 2;
		}
		if (bmshooter>50) {
			bmshooter = 0;
			_root.soundMc.fire();
			var uber = _root.attachMovie("mm", "mm"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			uber._x = _x-28;
			uber._y = _y+80;
			var uberb = _root.attachMovie("mn", "mn"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			uberb._x = _x-28;
			uberb._y = _y+80;
			var missile = _root.attachMovie("bm", "bm"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			missile._x = _x-28;
			missile._y = _y+80;
		}
		shootTimerB += 2;
		if (shootTimerB>40) {
			if (this.hitTest(_root.Missile)) {
				explode();
			}
		}
	}
	function explode() {
		_root.soundMc.upper();
		var reward = _root.attachMovie("RewardPoints", "RewardPoints"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		reward._x = _x;
		reward._y = _y;
		reward.field.text = 5000;
		var explosion = _root.attachMovie("Explosion", "Explosion"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.ship.updateScore(500);
		_root.shkill.skill += 320;
		_root.phouah.power += 120;
		_root.lhukke.luck += 90;
	}
	function takeDamage() {
		health -= 30;
		if (health<1) {
			explode();
		}
	}
}

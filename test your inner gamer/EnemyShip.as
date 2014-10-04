class EnemyShip extends MovieClip {
	var speed;
	var shootTimer;
	var loli;
	function onLoad() {
		_x = 700;
		_y = Math.random()*300+50;
		speed = Math.random()*5+5;
		shootTimer = 0;
		loli = 40;
	}
	function onEnterFrame() {
		_x -= speed;
		if (this._x<-20) {
			_root.ship.score -= loli;
			loli = 0;
		}
		if (_x<-100) {
			this.removeMovieClip();
		}
		if (this.hitTest(_root.ship)) {
			if (_root.ship.shield._visible == false) {
				_root.ship.updateHealth(-20);
			}
			explode();
		}
		shootTimer += 1;
		if (shootTimer>30) {
			shootTimer = 0;
			_root.soundMc.wootie();
			var missile = _root.attachMovie("EnemyMissile", "EnemyMissile"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			missile._x = _x-50;
			missile._y = _y+2;
		}
	}
	function explode() {
		_root.soundMc.upper();
		var reward = _root.attachMovie("RewardPoints", "RewardPoints"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		reward._x = _x;
		reward._y = _y;
		reward.field.text = 25;
		var explosion = _root.attachMovie("Explosion", "Explosion"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.ship.updateScore(80);
		_root.shkill.skill += 50;
		_root.phouah.power += 25;
		_root.lhukke.luck += 7;
	}
	function takeDamage() {
		explode();
	}
}

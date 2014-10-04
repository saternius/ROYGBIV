class MiniBoss extends MovieClip {
	var drift;
	var speed;
	var shootTimer;
	var health;
	var loli;
	var checker;
	var driftspace;
	var google;
	var googler;
	var googli;
	function onLoad() {
		googler = Math.random()*40+20;
		google = 0;
		googli = 0;
		_x = 700;
		_y = Math.random()*200+50;
		speed = 2.5;
		shootTimer = 0;
		health = 75;
		loli = 65;
		drift = Math.random()*6;
		checker = 1;
	}
	function onEnterFrame() {
		if (checker>0) {
			_y += drift;
			google += 1;
		}
		if (checker<1) {
			_y -= drift;
			googli += 1;
		}
		if (googli>googler) {
			googli = 0;
			checker = 1;
		}
		if (google>googler) {
			google = 0;
			checker = 0;
		}
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
		shootTimer += 1.5;
		if (shootTimer>30) {
			shootTimer = 0;
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
		reward.field.text = 500;
		var explosion = _root.attachMovie("Explosion", "Explosion"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.ship.updateScore(350);
		_root.shkill.skill += 205;
		_root.phouah.power += 100;
		_root.lhukke.luck += 57;
	}
	function takeDamage() {
		health -= 30;
		if (health<1) {
			explode();
		}
	}
}

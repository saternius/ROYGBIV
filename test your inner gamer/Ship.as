class Ship extends MovieClip {
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	var powerupTimer;
	var miniBossTimer;
	var mxtlvlTimer;
	var aTimer;
	var score;
	var health;
	var helper;
	var increase;
	var increased;
	function onLoad() {
		increase=1;
		increased=1;
		helper=2;
		velocity = 3;
		shootLimiter = 0;
		enemyTimer = 0;
		powerupTimer = 0;
		mxtlvlTimer = 3;
		aTimer = 0;
		enemies = [];
		resetScore();
		resetHealth();
		miniBossTimer = 0;
		_root.ship.shield._visible = false;
		_root.gameOverMenu._visible = false;
		_root.gameOverMenu.ta.onPress = function() {
			_root.ship.newGame();
		};
	}
	function onEnterFrame() {
		
		if (_visible == true) {
			shootLimiter += helper;
			if (Key.isDown(Key.RIGHT)) {
				_x = _x+velocity;
			}
			if (Key.isDown(Key.LEFT)) {
				_x = _x-velocity;
			}
			if (Key.isDown(Key.UP)) {
				_y = _y-velocity;
			}
			if (Key.isDown(Key.DOWN)) {
				_y = _y+velocity;
			}
			if (Key.isDown(Key.SPACE) && shootLimiter>21) {
				shootLimiter = 0;
				_root.soundMc.sound();
				var missile = _root.attachMovie("Missile", "Missile"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
				missile._x = _x+30;
				missile._y = _y+6;
			}
			enemyTimer += increase;
			if (enemyTimer>60) {
				increase+=.03;
				enemyTimer = 0;
				var enemy = _root.attachMovie("EnemyShip", "EnemyShip"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
				enemies.push(enemy);
			}
			if (!_root.miniBoss) {
				miniBossTimer += increase;
				if (miniBossTimer>200) {
					miniBossTimer = 0;
					if (mxtlvlTimer == 0) {
						var enemy = _root.attachMovie("Mxtlvl", "mxlvl", _root.getNextHighestDepth());
						enemies.push(enemy);
						mxtlvlTimer = 3;
					} else {
						var enemy = _root.attachMovie("MiniBoss", "miniBoss", _root.getNextHighestDepth());
						enemies.push(enemy);
						mxtlvlTimer -= 1;
					}
				}
			}
			powerupTimer += increased;
			if (powerupTimer>350) {
				increased+=.01;
				powerupTimer = 0;
				var powerup = _root.attachMovie("PowerUp", "PowerUp"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			}
			aTimer += increase;
			if (aTimer>1800) {
				var invbar = _root.attachMovie("invbar", "invbar"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			}
			if (_root.ship.shield._visible == true) {
				_root.ship.shield._alpha -= .5;
				if (_root.ship.shield._alpha<0) {
					_root.ship.shield._visible = false;
					_root.ship.shield._alpha = 100;
				}
			}
		}
	}
	function updateScore(points) {
		score += points;
		_root.scoreText.text = score;
	}
	function resetScore() {
		score = 0;
		_root.scoreText.text = score;
	}
	function updateHealth(points) {
		health += points;
		if (health<1) {
			health = 0;
			_root.gameOverMenu._visible = true;
			_root.gameOverMenu.go+=5;
			explode();
		}
		_root.hm.bar._xscale = health;
	}
	function resetHealth() {
		health = 100;
		_root.hm.bar._xscale = 100;
	}
	function explode() {
		this._visible = false;
		_root.soundMc.upper();
		_root.gameOverMenu.go+=5;
		var explosion = _root.attachMovie("Explosion", "Explosion"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		for (var i in enemies) {
			enemies[i].explode();
		}
	}
	function newGame() {
		this._visible = true;
		_root.gameOverMenu._visible = false;
		resetHealth();
		resetScore();
		mxtlvlTimer = 3;
		aTimer = 0;
	}
	function gnl() {
		gotoAndPlay(102);
		explode();
	}
}

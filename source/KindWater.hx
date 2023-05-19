package;

class Liquid extends MainSprite
{
	public var killsWhenTouched:Bool = false;
	// In development
	public var firesUpPlayer:Bool = false;
	public var stopsBurningPlayer:Bool = false;

	public var slowWalk:Bool = false;

	public var liquidType(default, set):String = '';

	inline function set_liquidType(v:String):String
	{
		if (liquidType != v)
		{
			liquidType = v;
			reload();
		}
		return v;
	}

	public function new(x:Float = 0, y:Float = 0, LiquidType:String = '')
	{
		super(x, y);
		this.liquidType = LiquidType;
	}

	function reload()
	{
		switch (liquidType)
		{
			case 'poison':
				loadGraphic(Paths.liquid__png, true, 16, 16);
				animation.add("posion", [2]);
				animation.play("posion");
				killsWhenTouched = true;
				slowWalk = false;
				firesUpPlayer = false;
			case 'water':
				loadGraphic(Paths.liquid__png, true, 16, 16);
				animation.add("water", [1]);
				animation.play("water");
				killsWhenTouched = false;
				//stopsBurningPlayer = true; // stops the player for burning if its in flames. For that we need a "fire" timer.
				slowWalk = true;
				firesUpPlayer = false;
			case 'lava':
				loadGraphic(Paths.liquid__png, true, 16, 16);
				animation.add("lava", [0]);
				animation.play("lava");
				killsWhenTouched = false;
				slowWalk = false;
				firesUpPlayer = true;
		}
	}
}

/**
 * Just a empty class but using this for other stuff
 */
class KindWater extends MainSprite {}

class Water extends MainSprite
{
	public var slowWalk:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic(Paths.liquid__png, true, 16, 16);
		animation.add("water", [1]);
		animation.play("water");
	}
}

class Lava extends MainSprite
{
	public var killsWhenTouched:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic(Paths.liquid__png, true, 16, 16);
		animation.add("lava", [0]);
		animation.play("lava");
	}
}

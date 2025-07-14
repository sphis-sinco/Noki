package;

import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

class PlayState extends FlxState
{
	public var level:Array<Int> = [];
	public var level_number:Int = 0;

	public var tiles:FlxTypedGroup<Tile> = new FlxTypedGroup<Tile>();

	override public function new(levelNum:Int = 1)
	{
		super();

		level_number = levelNum;
		level = LevelGenerator.generateLevel(level_number);
	}

	public var player:Tile = new Tile(PLAYER, new FlxPoint(0, 0));

	override public function create()
	{
		super.create();

		final playerPosition = LevelGenerator.getPlayerGridPosition(level_number);
		player.setPosition(8 * playerPosition[0], 8 * playerPosition[1]);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

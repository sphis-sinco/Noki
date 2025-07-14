package;

import Tile.TileType;
import flixel.FlxG;
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

		var x = 0;
		var y = 0;
		for (tile in level)
		{
			var tile_type:TileType = TILE;

			switch (tile)
			{
				case 2:
					tile_type = FALLING_TILE;
				case 3:
					tile_type = PLAYER;
				case 4:
					tile_type = KEY;
				case 5:
					tile_type = DOOR;
			}

			var newTile:Tile = new Tile(tile_type, new FlxPoint(8 * x, 8 * y));
			if (tile != 0)
				tiles.add(newTile);

			x++;
			if (x == 8)
			{
				x = 0;
				y++;

				if (y == 8)
					break;
			}
		}

		add(tiles);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		final left = FlxG.keys.anyJustReleased([LEFT, A]);
		final down = FlxG.keys.anyJustReleased([DOWN, S]);
		final up = FlxG.keys.anyJustReleased([UP, W]);
		final right = FlxG.keys.anyJustReleased([RIGHT, D]);

		if (left || down || up || right)
		{
			if (left)
				player.x -= player.width;
			else if (right)
				player.x += player.width;
			else if (up)
				player.y -= player.height;
			else if (down)
				player.y += player.height;

			for (tile in tiles)
			{
				if (player.overlaps(tile))
				{
					if (left)
						player.x += player.width;
					else if (right)
						player.x -= player.width;
					else if (up)
						player.y += player.height;
					else if (down)
						player.y -= player.height;
				}
			}

			if (player.x < 0)
				player.x = 0;
			else if (player.x > FlxG.width - player.width)
				player.x -= player.width;

			if (player.y < 0)
				player.y = 0;
			else if (player.y > FlxG.height - player.height)
				player.y -= player.height;
		}
	}
}

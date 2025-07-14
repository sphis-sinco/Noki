package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Tile extends FlxSprite
{
	public var tile:TileType;

	override public function new(tileType:TileType, position:FlxPoint)
	{
		super(position.x, position.y);

		loadGraphic('assets/tiles.png', true, 8, 8);
		animation.add('tileset', [0, 1, 2, 3, 4], 0, false);

		tile = tileType;

		switch (tileType)
		{
			case TILE:
				animation.frameIndex = 0;
			case FALLING_TILE:
				animation.frameIndex = 1;
			case PLAYER:
				animation.frameIndex = 2;
			case KEY:
				animation.frameIndex = 3;
			case DOOR:
				animation.frameIndex = 4;
		}
	}
}

enum TileType
{
	// Palette 1
	TILE;
	FALLING_TILE;

	// Palette 2
	PLAYER;
	KEY;
	DOOR;
}

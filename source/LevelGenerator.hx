package;

class LevelGenerator
{
	public static function generateLevel(levelIndex:Int):Array<Int>
	{
		if (levelIndex == 1)
		{
			return [
				1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 1, 1, 1, 1, 0, 1,
				1, 0, 0, 0, 4, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 1, 1, 1, 1, 0, 1,
				1, 5, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1
			];
		}

		return [
			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0,

			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0
		];
	}

	public static function getPlayerGridPosition(levelIndex:Int):Array<Int>
	{
		if (levelIndex == 1)
		{
			return [1, 1];
		}

		return [0, 0];
	}
}

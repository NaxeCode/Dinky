package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Lucas
 */
class Coin extends FlxSprite
{

	public function new(inX:Int, inY:Int) 
	{
		super(inX, inY);
		
		makeGraphic(4, 8, FlxColor.GOLDEN);
	}
	
}
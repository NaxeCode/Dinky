package levels;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Lucas
 */
class Wall extends FlxSprite
{

	public function new(X:Int, Y:Int, Width:Int, Height:Int, Color:Int=FlxColor.WHITE) 
	{
		super(X, Y);
		
		makeGraphic(Width, Height, Color);
		immovable = true;
		moves = false;
		solid = true;
	}
	
}
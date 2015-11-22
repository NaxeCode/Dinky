package levels;

import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Lucas
 */
class Floor extends FlxExtendedSprite
{
	/**
	 * This function creates a flat colored square to use for floors.
	 * @param	X		The X coordinate of this sprite.
	 * @param	Y		The Y coordinate of this sprite.
	 * @param	Width		The width of the sprite you want to generate.
	 * @param	Height		The height of the sprite you want to generate.
	 * @param	Color			Specifies the color of the generated block (ARGB format).
	 * @return	This FlxSprite instance (nice for chaining stuff together, if you're into that).
	 */
	public function new(X:Int, Y:Int, Width:Int, Height:Int, Color:Int)
	{
		super(X, Y);
		makeGraphic(Width, Height, Color);
		immovable = true;
		moves = false;
		solid = true;
		allowCollisions = FlxObject.UP;
	}
	
}
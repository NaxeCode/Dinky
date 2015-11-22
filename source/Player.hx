package;

import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author Lucas
 */
class Player extends FlxExtendedSprite
{

	public function new(X:Int, Y:Int) 
	{
		super(X, Y);
		initProperties();
		initDebug();
	}
	private function initProperties()
	{
		FlxG.plugins.add(new FlxMouseControl());
		makeGraphic(32, 32);
		
		
		enableMouseThrow(10, 10);
		setGravity(0, 600, 1000, 1000, 10, 1);
	}
	private function initDebug():Void // Add your debug-related commands here! :D
	{
		FlxG.watch.add(this, "velocity");
		FlxG.watch.add(this, "acceleration");
		FlxG.watch.add(this, "isTouching(FlxObject.FLOOR)", "On Floor");
	}
}
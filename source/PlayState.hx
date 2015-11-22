package;

import flixel.addons.effects.FlxTrail;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxG.camera;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.system.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import levels.Floor;
import levels.Platform;
import levels.Wall;


class PlayState extends FlxState
{
	public var player:Player;
	private var floor:Floor;
	private var platform:Platform;
	private var wall:Wall;
	
	// Groups.
	private var levelElements:FlxGroup; // Contains all of the level elements.
	private var theFloors:FlxGroup; // The ground objects.
	private var thePlats:FlxGroup; // The platform objects.
	private var theWalls:FlxGroup; // The wall's.
	private var coinGroup:FlxGroup; // Coins.
	private var hud:FlxGroup; // The hud.
	
	// HUD/User Interface stuff (texty stuff)
	private var scoreText:FlxText;
	private var authorText:FlxText;
	private var lifeText:FlxText;
	
	override public function create():Void
	{
		initLevel();
		initCoins();
		initHUD();
		initProperties();
		initCamera();
		initDebug();
		super.create();
	}
	// Update
	override public function update():Void
	{
		FlxG.collide(levelElements, player);
		FlxG.overlap(coinGroup, player, coinCollect);
		
		initLives();
		//initTrail();
		player.update();
		super.update();
	}	
	/* Use this function is ment to hold misc variables and properties
	 * that don't belong to / require a function. */
	private function initProperties():Void
	{
		player = new Player(50, 50);
		add(player);
	}
	private function initLevel():Void // Add's the level objects (Floors)
	{
		theFloors = new FlxGroup();
		thePlats = new FlxGroup();
		theWalls = new FlxGroup();
		levelElements = new FlxGroup();
		levelElements.add(theFloors);
		levelElements.add(thePlats);
		levelElements.add(theWalls);
		
		theFloors.add(new Floor(0, 470, 160, 130, FlxColor.TEAL));
		theFloors.add(new Floor(250, 470, 320, 130, FlxColor.TEAL));
		theFloors.add(new Floor(537, 414, 147, 13, FlxColor.TEAL));
		theFloors.add(new Floor(707, 330, 145, 50, FlxColor.TEAL));
		
		//thePlats.add(new Platform(
		
		//thePlats.add(new Platform(435, 150, 75, 50, FlxColor.
		add(levelElements);
	}
	private function initCoins():Void // Custom function to add coins to the level.
	{
		coinGroup = new FlxGroup();
		for (i in 0...20)
		{
			coinGroup.add(new Coin(i * 15, 220));
			coinGroup.add(new Coin(i * 15, 190));
		}
		add(coinGroup);
	}
	private function initDebug():Void // Add your debug-related commands here! :D
	{
		FlxG.log.redirectTraces = true;
		FlxG.debugger.drawDebug = false;
		FlxG.debugger.visible = true;
		FlxG.watch.addMouse();
	}
	private function initHUD():Void // Add HUD-related objects here.
	{
		hud = new FlxGroup();
		Reg.score = 0; // Set score to 0.
		
		scoreText = new FlxText(0, 0, 100, "Score: " + Reg.score);
		lifeText = new FlxText(315, 0, 100, "Lives: " + Reg.lives);
		authorText = new FlxText(200, 0, 100, "Author: Lucas (NarutoCode) @NaruCoder on Twitter");
		
		lifeText.setFormat(null, lifeText.size , FlxColor.LIME);
		
		hud.add(scoreText); // Score Stuff
		hud.add(lifeText); // Lives stuff
		hud.add(authorText); // Credits stuff REPLACE THIS WITH A CREDTIS SCREEN!!
		
		hud.setAll("scrollFactor", FlxPoint.get(0, 0));
		hud.setAll("cameras", [FlxG.camera]);
		
		add(hud);
	}
	private function initCamera():Void // Adjust or add camera properties here.
	{
		FlxG.camera.bgColor = FlxColor.FOREST_GREEN;
		FlxG.camera.setBounds(0, 0, 1400, 600, true);
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		
	}
	private function initLives()
	{
		if (player.y > 1400)
		{
			FlxG.resetState();
		}
	}
	private function coinCollect(thisCoin:FlxObject, thisPlayer:FlxObject):Void
	{
		thisCoin.destroy();
		Reg.score++;
		scoreText.text = "Score: " + Reg.score;
	}
	// Destroy
	override public function destroy():Void
	{
		super.destroy();
	}
}
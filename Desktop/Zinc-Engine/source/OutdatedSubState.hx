package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);
		
		var ZincLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('ZincEngineLogo'));
		ZincLogo.scale.y = 0.3;
		ZincLogo.scale.x = 0.3;
		ZincLogo.x -= ZincLogo.frameHeight;
		ZincLogo.y -= 180;
		ZincLogo.alpha = 0.8;
		add(ZincLogo);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Zinc Engine is outdated!\nYou are on "
			+ MainMenuState.ZincEngineVer
			+ "\nwhile the most recent version is " + needVer + "."
			+ "\n\nWhat's new:\n\n"
			+ currChanges
			+ "\n& more changes and bugfixes in the full changelog"
			+ "\n\nPress Space to view the full changelog and update\nor ESCAPE to ignore this",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		FlxTween.angle(ZincLogo, ZincLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(ZincLogo.angle == -10) FlxTween.angle(ZincLogo, ZincLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(ZincLogo, ZincLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(ZincLogo.alpha == 0.8) FlxTween.tween(ZincLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(ZincLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			fancyOpenURL("https://Zincdev.github.io/Zinc-Engine/changelogs/changelog-" + needVer);
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}

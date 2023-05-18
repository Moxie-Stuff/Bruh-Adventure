package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class AwardsMenu extends MainState
{
	final awards:Array<Array<String>> = [
		["Wow... For sure that was hard...", "Finish Level 1 EX"],
		["Oooh... Shiny!", "Collect 20 Yellow Coins"],
		["Are these... Avocados!?", "Collect 20 Green Coins"],
		["I'm... tired.", "Collect 5 Super Coins"],
		["Is this real?!", "Collect 2 Fake Coins"],
		["So that was what I had to do!", "Collect 1 Rewarded Coin"]
	];
	var textAwards:FlxText;
	var textAwardDescription:FlxText;
	var curPage:Int = 0;

	override public function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
		bg.screenCenter();
		bg.scrollFactor.set();
		add(bg);

		textAwards = new FlxText(0, 0, 0, "", 20);
		// textCredits.scrollFactor.set();
		// textCredits.alignment = CENTER;
		textAwards.screenCenter(Y);
		add(textAwards);

		textAwardDescription = new FlxText(0, 20, 0, "", 20);
		textAwardDescription.screenCenter(Y);
		textAwardDescription.y -= 20;
		textAwardDescription.alignment = CENTER;
		add(textAwardDescription);

		changeText();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([UP, W]))
		{
			changeText(-1);
		}

		if (FlxG.keys.anyJustPressed([DOWN, S]))
		{
			changeText(1);
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MenuState());
		}
	}

	function changeText(change:Int = 0)
	{
		curPage += change;
		if (curPage >= awards.length)
			curPage = 0;
		if (curPage < 0)
			curPage = awards.length - 1;

		textAwards.text = awards[curPage][0];
		textAwardDescription = awards[curPage][1];
	}
}
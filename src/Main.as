package
{
import flash.display.Sprite;
import flash.geom.Rectangle;

import screens.InGame;

import starling.core.Starling;

[SWF(width="480", height="480", frameRate="60", backgroundColor="#ffffff")]
public class Main extends Sprite
{
    private var mStarling:Starling;

    public function Main()
    {

        // Create a Starling instance that will run the "Game" class
        mStarling = new Starling(Game, stage);
        mStarling.antiAliasing = 1;
        mStarling.start();
    }
}
}
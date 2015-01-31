/**
 * Created by nzhul on 1/30/2015.
 */
package screens {

import events.NavigationEvent;

import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import com.greensock.TweenMax;
import com.greensock.easing.*;

public class Welcome extends Sprite{

    private var bg:Image;
    private var circle:Image;
    private var gameTitle:Image;

    private var playBtn:Button;
    private var aboutBtn:Button;

    public function Welcome() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);
    }

    private function onAddedToStage(event:Event):void{
        trace("welcome screen initialized");
        drawScreen();
    }

    private function drawScreen():void{
        bg = new Image(Assets.getTexture("BGWallpaper"));
        bg.width = 480;
        bg.height = 480;
        this.addChild(bg);

        circle = new Image(Assets.getTexture("Circle"));
        this.addChild(circle);
        circle.x = -circle.width;
        circle.y = 100;

        gameTitle = new Image(Assets.getTexture("GameTitle"));
        this.addChild(gameTitle);
        gameTitle.x = stage.width;
        gameTitle.y = 100;

        playBtn = new Button(Assets.getTexture("PlayBtn"));
        playBtn.x = stage.width;
        playBtn.y = 350;
        this.addChild(playBtn);

        this.addEventListener(Event.TRIGGERED, onMainMenuClick);
    }

    private function onMainMenuClick(event:Event):void{

        var buttonClicked:Button = event.target as Button;

        if((buttonClicked as Button) == playBtn){
            this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
        }
    }

    public function disposeTemporarily():void{
        this.visible = false;
        if(this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, circleAnimation);
    }

    public function initialize():void{
        this.visible = true;
        circle.x = -circle.width;
        circle.y = 100;

        TweenMax.to(circle, 1, {x: 80, ease:Elastic.easeOut});
        TweenMax.to(gameTitle, 1, {x: 250, ease:Elastic.easeOut});
        TweenMax.to(playBtn, 1, {x: 335, ease:Elastic.easeOut});

        this.addEventListener(Event.ENTER_FRAME, circleAnimation)

    }

    private function circleAnimation(event:Event):void{
        var currentDate:Date = new Date();
        circle.y = 100 + (Math.cos(currentDate.getTime()*0.002) * 10);
        gameTitle.y = 100 + (Math.cos(currentDate.getTime()*0.002) * 10);
        playBtn.y = 260 + (Math.cos(currentDate.getTime()*0.002) * 10);
    }
}
}

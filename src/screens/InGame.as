/**
 * Created by nzhul on 1/31/2015.
 */
package screens {

import com.greensock.TweenLite;

import flash.geom.Point;

import objects.Circle;

import starling.display.Button;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import com.greensock.TweenMax;
import com.greensock.easing.*;

public class InGame extends Sprite{

    private var circle:Circle;
    private var bg:Image;
    private var circlesArray:Vector.<Circle>;
    private var circlesTotalCount:int;
    private var currentHitCount:int;

    private var score:int;
    private var circlesSpeed:int;

    public function InGame() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void{
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawGame();
    }

    private function drawGame():void{

        bg = new Image(Assets.getTexture("BGWallpaper"));
        bg.width = 480;
        bg.height = 480;
        this.addChild(bg);

        generateCircles(circlesTotalCount);

        this.addEventListener(TouchEvent.TOUCH, onTouch);
        this.addEventListener(Event.ENTER_FRAME, circleAnimation)

    }

    private function generateCircles(circlesTotalCount:int):void {
        trace("into generateCircles");
        trace(circlesTotalCount);
        for(var i:uint = 0; i<circlesTotalCount;i++){
            var newCircle:Circle = new Circle(1,1);
            newCircle.x = (i*20)+50;
            circlesArray.push(newCircle);

            this.addChild(newCircle);
        }
    }

    private function circleAnimation(event:Event):void{
            for(var i:uint = 0; i<circlesArray.length;i++) {
            var currentCircle = circlesArray[i];
            currentCircle.timer += 1;
            if(currentCircle.timer >= currentCircle.duration){
                currentCircle.pickDirection();
            }
            currentCircle.x += currentCircle.xSpeed;
            currentCircle.y += currentCircle.ySpeed;
        }


    }

    private function onTouch(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
        if (touch)
        {
            var localPos:Point = touch.getLocation(this);

            for(var i:uint = 0; i<circlesArray.length;i++) {
                var currentCircle = circlesArray[i];
                if(localPos.x >= (currentCircle.x - currentCircle.width / 2) && localPos.x<= (currentCircle.x + currentCircle.width / 2)
                        && localPos.y >= (currentCircle.y - currentCircle.height / 2) && localPos.y<= (currentCircle.y + currentCircle.height / 2)){
                    trace("Object Clicked! at position: " + localPos);
                    currentCircle.alreadyHit = true;
                    score += 10;
                    currentHitCount++;
                    circlesArray.splice(i, 1);

                    if(currentHitCount == circlesTotalCount){
                        // Add One more Circle to the circlesArray and show them all to the stage.
                        currentHitCount = 0;
                        circlesTotalCount++;
                        generateCircles(circlesTotalCount);
                    }
                    trace(score);
                }
            }
        }

    }

    public function disposeTemporarily():void{
        this.visible = false;
    }

    public function initialize():void{
        this.visible = true;
        score = 0;
        circlesSpeed = 10;
        circlesTotalCount = 1;
        circlesArray = new Vector.<Circle>();
    }
}
}

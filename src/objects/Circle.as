/**
 * Created by nzhul on 1/31/2015.
 */
package objects {

import starling.display.Image;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;

public class Circle extends Sprite{

    private var _type:int;
    private var _xSpeed:int;
    private var _ySpeed:int;
    private var _timer:int;
    private var _duration:int;
    private var _size:int;
    private var _alreadyHit:Boolean;
    private var circleImage:Image;
    private var circleDestroyedImage:Image;

    public function Circle(_type:int, _size:int, _xSpeed:int = 0, _ySpeed:int = 0) {
        super();
        this._type = _type;
        this._xSpeed = _xSpeed;
        this._ySpeed = _ySpeed;
        this._size = _size;

        this._alreadyHit = false;

        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    public function pickDirection():void{
        this.timer = 0;
        var xMax:int;
        var xMin:int;
        var yMax:int;
        var yMin:int;
        if(this.x <= 50){
            xMax = 10;
            xMin = 5;
        } else if(this.x >= 0 && this.x <= stage.width - 150){
            xMax = 10;
            xMin = -5;
        } else if(this.x >= stage.width - 150){
            xMax = -10;
            xMin = -5;
        }
        if(this.y <= 50){
            yMax = 10;
            yMin = 5;
        } else if(this.y >= 0 && this.y <= stage.height - 200){
            yMax = 10;
            yMin = -5;
        } else if(this.y >= stage.height - 200){
            yMax = -10;
            yMin = -5;
        }
        var durMax = 30;
        var durMin = 10;
        this.xSpeed = Math.floor(Math.random() * (xMax - xMin + 1)) + xMin;
        this.ySpeed = Math.floor(Math.random() * (yMax - yMin + 1)) + yMin;
        this.duration = Math.floor(Math.random() * (durMax - durMin + 1)) + durMin;

    }

    private function onAddedToStage(event:Event):void{
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        createCircleArt();
        //createCircleDestroyedArt();
    }

    private function createCircleDestroyedArt():void {
        circleDestroyedImage = new Image(Assets.getTexture("Circle_Destroyed"));
        circleDestroyedImage.visible = false;
        this.addChild(circleDestroyedImage);
    }

    private function createCircleArt():void{

        this.circleImage = new Image(Assets.getTexture("Circle"+this.type));
        this.circleImage.x = Math.ceil(-this.circleImage.width/2);
        this.circleImage.y = Math.ceil(-this.circleImage.height/2);
        this.addChild(this.circleImage);
    }

    public function disposeTemporarily():void{
        this.visible = false;
    }

    public function get alreadyHit():Boolean {
        return _alreadyHit;
    }

    public function set alreadyHit(value:Boolean):void {
        _alreadyHit = value;

        if(value){
            //circleDestroyedImage.visible = true;
            circleImage.visible = false;
        }
    }

    public function get xSpeed():int {
        return _xSpeed;
    }

    public function set xSpeed(value:int):void {
        _xSpeed = value;
    }

    public function get ySpeed():int {
        return _ySpeed;
    }

    public function set ySpeed(value:int):void {
        _ySpeed = value;
    }

    public function get size():int {
        return _size;
    }

    public function set size(value:int):void {
        _size = value;
    }

    public function get timer():int {
        return _timer;
    }

    public function set timer(value:int):void {
        _timer = value;
    }

    public function get duration():int {
        return _duration;
    }

    public function set duration(value:int):void {
        _duration = value;
    }

    public function get type():int {
        return _type;
    }

    public function set type(value:int):void {
        _type = value;
    }
}
}

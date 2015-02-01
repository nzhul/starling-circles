/**
 * Created by nzhul on 1/30/2015.
 */
package {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;

public class Assets {
        [Embed(source="../media/graphics/circle.png")]
        public static const Circle:Class;

        [Embed(source="../media/graphics/circle1.png")]
        public static const Circle1:Class;

        [Embed(source="../media/graphics/circle2.png")]
        public static const Circle2:Class;

        [Embed(source="../media/graphics/circle3.png")]
        public static const Circle3:Class;

        [Embed(source="../media/graphics/circle4.png")]
        public static const Circle4:Class;

        [Embed(source="../media/graphics/bgwallpaper.jpg")]
        public static const BGWallpaper:Class;

        [Embed(source="../media/graphics/playBtn.png")]
        public static const PlayBtn:Class;

        [Embed(source="../media/graphics/gameLogo.png")]
        public static const GameTitle:Class;

        [Embed(source="../media/fonts/embedded/BuxtonSketch.ttf", fontFamily="MyFontName", embedAsCFF="false")]
        public static var MyFont:Class;

        private static var gameTextures:Dictionary = new Dictionary();

        public static function getTexture(name:String):Texture
        {
            if(gameTextures[name] == undefined) {
                var bitmap:Bitmap = new Assets[name]();
                gameTextures[name] = Texture.fromBitmap(bitmap);
            }
            return gameTextures[name];
        }
    }
}

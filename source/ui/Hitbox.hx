package ui;

import flixel.graphics.FlxGraphic;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.ui.FlxVirtualPad;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

// copyed from flxvirtualpad
class Hitbox extends FlxSpriteGroup
{
    public var hitbox:FlxSpriteGroup;

    var sizex:Int = 320;

    var screensizey:Int = 720;

    var frameshb:FlxAtlasFrames;

    public var k1:FlxButton;
    public var k2:FlxButton;
    public var k3:FlxButton;
    public var k4:FlxButton;
    public var k5:FlxButton;
    public var k6:FlxButton;
    public var k7:FlxButton;
    public var k8:FlxButton;
    public var k9:FlxButton;
    public var k10:FlxButton;
    public var k11:FlxButton;
    
    public function new(type:HitboxType = DEFAULT)
    {
        super();

        trace(type);

        //add graphic
        hitbox = new FlxSpriteGroup();
        hitbox.scrollFactor.set();
        
        var hitbox_hint:FlxSprite = new FlxSprite(0, 0);
        hitbox_hint.alpha = 0.3;
        add(hitbox_hint);

        // stupid way to fix crash
        k1 = new FlxButton(0, 0);
        k2 = new FlxButton(0, 0);
        k3 = new FlxButton(0, 0);
        k4 = new FlxButton(0, 0);
        k5 = new FlxButton(0, 0);
        k6 = new FlxButton(0, 0);
        k7 = new FlxButton(0, 0);
        k8 = new FlxButton(0, 0);
        k9 = new FlxButton(0, 0);
        k10 = new FlxButton(0, 0);
        k11 = new FlxButton(0, 0);

        switch (type){
            case ONE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox1k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox1k.png', 'assets/shared/images/hitbox/hitbox1k.xml');
                sizex = 1280;
                
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
            }
            case TWO:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox2k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox2k.png', 'assets/shared/images/hitbox/hitbox2k.xml');
                sizex = 640;
                
                hitbox.add(add(k1 = createhitbox(0, "k1")));
                hitbox.add(add(k1 = createhitbox(sizex, "k2"))); //
            }
            case THREE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox3k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox3k.png', 'assets/shared/images/hitbox/hitbox3k.xml');
                sizex = 426;
                
                hitbox.add(add(k1 = createhitbox(0, "k1")));
                hitbox.add(add(k1 = createhitbox(sizex, "k2")));
                hitbox.add(add(k1 = createhitbox(sizex * 2, "k3"))); //
            }                                       
            case FIVE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox5k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox5k.png', 'assets/shared/images/hitbox/hitbox5k.xml');
                sizex = 256;
                
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
            } 
            case SIX:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox6k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox6k.png', 'assets/shared/images/hitbox/hitbox6k.xml');
                sizex = 213;
                
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
            }
            case SEVEN:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox_hint7k.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox7k.png', 'assets/shared/images/hitbox/hitbox7k.xml');
                sizex = 182;
                
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(k7 = createhitbox(sizex * 6, "k7"))); 
            }              
            case EIGHT:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox8k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox8k.png', 'assets/shared/images/hitbox/hitbox8k.xml');
                sizex = 160;
            
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(k7 = createhitbox(sizex * 6, "k7")));
                hitbox.add(add(k8 = createhitbox(sizex * 7, "k8"))); 
            }                            
            case NINE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox9k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox9k.png', 'assets/shared/images/hitbox/hitbox9k.xml');
                sizex = 142;
            
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(k7 = createhitbox(sizex * 6, "k7")));
                hitbox.add(add(k8 = createhitbox(sizex * 7, "k8"))); 
                hitbox.add(add(k9 = createhitbox(sizex * 8, "k9")));
            }
            case TEN:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox9k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox9k.png', 'assets/shared/images/hitbox/hitbox9k.xml');
                sizex = 120;
            
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(k7 = createhitbox(sizex * 6, "k7")));
                hitbox.add(add(k8 = createhitbox(sizex * 7, "k8"))); 
                hitbox.add(add(k9 = createhitbox(sizex * 8, "k9")));
                hitbox.add(add(k10 = createhitbox(sizex * 9, "k10")));
            }     
            case ELEVEN:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox9k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox9k.png', 'assets/shared/images/hitbox/hitbox9k.xml');
                sizex = 102;
            
                hitbox.add(add(k1 = createhitbox(0, "k1"))); //
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3"))); //
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(k5 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(k6 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(k7 = createhitbox(sizex * 6, "k7")));
                hitbox.add(add(k8 = createhitbox(sizex * 7, "k8"))); 
                hitbox.add(add(k9 = createhitbox(sizex * 8, "k9")));
                hitbox.add(add(k10 = createhitbox(sizex * 9, "k10")));
                hitbox.add(add(k11 = createhitbox(sizex * 10, "k11")));
            }                                       
            default:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
                sizex = 320;

                hitbox.add(add(k1 = createhitbox(0, "k1")));
                hitbox.add(add(k2 = createhitbox(sizex, "k2")));
                hitbox.add(add(k3 = createhitbox(sizex * 2, "k3")));
                hitbox.add(add(k4 = createhitbox(sizex * 3, "k4")));    
            }
        }
    }

    public function createhitbox(X:Float, framestring:String) {
        var button = new FlxButton(X, 0);
        
        var graphic:FlxGraphic = FlxGraphic.fromFrame(frameshb.getByName(framestring));

        button.loadGraphic(graphic);

        button.alpha = 0;

    
        button.onDown.callback = function (){
            FlxTween.num(0, 0.75, .075, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        };

        button.onUp.callback = function (){
            FlxTween.num(0.75, 0, .1, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }
        
        button.onOut.callback = function (){
            FlxTween.num(button.alpha, 0, .2, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        return button;
    }

    override public function destroy():Void
        {
            super.destroy();
    
            k1 = null;
            k2 = null;
            k3 = null;
            k4 = null;
            k5 = null;
            k6 = null;
            k7 = null;
            k8 = null;
            k9 = null;
            k10 = null;
            k11 = null;
        }
}

enum HitboxType {
    DEFAULT;
    ONE;
    TWO;
    THREE;
    FIVE;
    SIX;
    SEVEN;
    EIGHT;
    TEN;
    ELEVEN;
}

/*if (widghtScreen == null)
widghtScreen = FlxG.width;*/

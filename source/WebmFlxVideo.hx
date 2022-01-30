package;

//Original author: Sirox
//The modifications: Saw
import flixel.system.FlxSound;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
import openfl.media.Sound;
import openfl.Lib;
#if sys
import sys.FileSystem;
import sys.io.File;
#end
import webm.*;

using StringTools;

class WebmFlxVideo extends FlxSprite
{
	public var player:WebmPlayer;
	public var endcallback:Void->Void = null;
	public var startcallback:Void->Void = null;
	public var sound:FlxSound;
    public var soundMultiplier:Float = 1;
    public var prevSoundMultiplier:Float = 1;
    public var videoFrames:Int = 0;
    public var doShit:Bool = false;
    public var io:WebmIo;
    public var altSource:String;
    public var stopped:Bool = false;
	public var restarted:Bool = false;
	public var started:Bool = false;
	public var ended:Bool = false;
	public var paused:Bool = false;
	public var useSound:Bool = false;

	public function new() {
        super();
    }
	
    public function playVideo(source:String, ownCamera:Bool = false, frameSkipLimit:Int = -1) {
        altSource = source;

        useSound = FileSystem.exists(altSource.replace(".webm", ".txt")) && FileSystem.exists(altSource.replace(".webm", ".ogg"));

        if (useSound) 
        {
            videoFrames = Std.parseInt(File.getContent(altSource.replace(".webm", ".txt")));
        }

        io = new WebmIoFile(altSource);
		player = new WebmPlayer();
		player.fuck(io, false);
		player.addEventListener(WebmEvent.PLAY, function(e) {
			trace("playing");
			if (startcallback != null) {
				startcallback();
			}
			started = true;
		});
		player.addEventListener(WebmEvent.COMPLETE, function(e) {
			trace("ended");
			if (endcallback != null) {
				endcallback();
			}
			ended = true;
		});
		player.addEventListener(WebmEvent.STOP, function(e) {
			trace("stopped");
			stopped = true;
		});
		player.addEventListener(WebmEvent.RESTART, function(e) {
			trace("restarted");
			restarted = true;
		});

		loadGraphic(player.bitmapData);

		if (useSound) {
		    sound = FlxG.sound.play(Sound.fromFile(altSource.replace(".webm", ".ogg")));
		    sound.time = sound.length * soundMultiplier;
		    doShit = true;
		}

		if (frameSkipLimit != -1)
		{
			player.SKIP_STEP_LIMIT = frameSkipLimit;	
		}

		if (ownCamera) {
		    var cam = new FlxCamera();
		    FlxG.cameras.add(cam);
		    cam.bgColor.alpha = 0;
		    cameras = [cam];
		}

        updateHitbox();
        play();
    }

    public static function calc(ind:Int):Dynamic
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		var width:Float = 1280;
		var height:Float = 720;
				
		var ratioX:Float = height / width;
		var ratioY:Float = width / height;
		var appliedWidth:Float = stageHeight * ratioY;
		var appliedHeight:Float = stageWidth * ratioX;
		//trace(appliedWidth);
		var remainingX:Float = stageWidth - appliedWidth;
		var remainingY:Float = stageHeight - appliedHeight;
		remainingX = remainingX / 2;
		remainingY = remainingY / 2;
		
		appliedWidth = Std.int(appliedWidth);
		appliedHeight = Std.int(appliedHeight);
		
		if (appliedHeight > stageHeight)
		{
			remainingY = 0;
			appliedHeight = stageHeight;
		}
		
		if (appliedWidth > stageWidth)
		{
			remainingX = 0;
			appliedWidth = stageWidth;
		}
		
		switch(ind)
		{
			case 0:
				return remainingX;
			case 1:
				return remainingY;
			case 2:
				return appliedWidth;
			case 3:
				return appliedHeight;
		}
		
		return null;
	}

	public function updatePlayer()
	{
		player.x = calc(0);
		player.y = calc(1);
		player.width = calc(2);
		player.height = calc(3);
	}
	
	public function play():Void
	{
		player.play();
	}
	
	public function stop():Void
	{
		player.stop();
	}
	
	public function restart():Void
	{
		player.restart();
	}
	
	public function togglePause():Void {
		if (paused) {
			resume();
		} else {
			pause();
		}
	}
	
	public function clearPause():Void {
		paused = false;
		player.removePause();
	}
	
	public function pause():Void {
		player.changePlaying(false);
		paused = true;
	}
	
	public function resume():Void {
		player.changePlaying(true);
		paused = false;
	}
	
	public function setAlpha(ok:Float):Void {
		player.alpha = ok;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		updatePlayer();

		if (useSound) {
			var wasFuckingHit = player.wasHitOnce;
			soundMultiplier = player.renderedCount / videoFrames;
			
			if (soundMultiplier > 1) {
				soundMultiplier = 1;
			}
			if (soundMultiplier < 0) {
				soundMultiplier = 0;
			}
			if (doShit) {
				var compareShit:Float = 50;
				if (sound.time >= (sound.length * soundMultiplier) + compareShit || sound.time <= (sound.length * soundMultiplier) - compareShit)
					sound.time = sound.length * soundMultiplier;
			}
			if (wasFuckingHit) {
				if (soundMultiplier == 0)
				{
					if (prevSoundMultiplier != 0)
					{
						sound.pause();
						sound.time = 0;
					}
				} else {
					if (prevSoundMultiplier == 0)
					{
						sound.resume();
						sound.time = sound.length * soundMultiplier;
					}
				}
			    prevSoundMultiplier = soundMultiplier;
			}
		}
	}
	
	override public function destroy() {
        player.stop();
        super.destroy();
    }
}

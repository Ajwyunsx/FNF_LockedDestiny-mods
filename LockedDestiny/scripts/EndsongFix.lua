function onEndSong()
    runHaxeCode([[
        FlxG.sound.music.stop();
        game.paused = false;
        FlxG.switchState(new LuaMenuState("FreeplayState"));
    ]])

    playMusic('freakyMenu', 1, true)

    return Function_Stop;
end
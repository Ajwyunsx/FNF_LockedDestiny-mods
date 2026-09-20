local shaderName = "rgbeffect3"

function onCreate()
    shaderCoordFix()

    makeLuaSprite("rgbeffect3")
    makeGraphic("shaderImage", screenWidth, screenHeight)

    setSpriteShader("shaderImage", shaderName)

    initShader()
    enableShaderGameOnly()
end

function onStepHit()
    if curStep == 16 then
        enableShaderBoth()

    elseif curStep == 1531 then
        disableShaderHUDOnly()

    elseif curStep == 1608 then
        disableShader()

    elseif curStep == 2120 then
        enableShaderGameOnly()
    end
end

function initShader()
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.getLuaObject("rgbeffect3").shader = shader0;
    ]])
end

function enableShaderGameOnly()
    runHaxeCode([[
        var shader = game.getLuaObject("rgbeffect3").shader;
        game.camGame.setFilters([new ShaderFilter(shader)]);
        game.camHUD.setFilters([]); //
    ]])
end

function enableShaderBoth()
    runHaxeCode([[
        var shader = game.getLuaObject("rgbeffect3").shader;
        game.camGame.setFilters([new ShaderFilter(shader)]);
        game.camHUD.setFilters([new ShaderFilter(shader)]);
    ]])
end

function disableShader()
    runHaxeCode([[
        game.camGame.setFilters([]);
        game.camHUD.setFilters([]);
    ]])
end

function disableShaderHUDOnly()
    runHaxeCode([[
        game.camHUD.setFilters([]);
    ]])
end

function onUpdate(elapsed)
    setShaderFloat(shaderName, "iTime", os.clock())
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[FlxG.signals.gameResized.remove(fixShaderCoordFix);]])
        if temp then temp() end
    end
end
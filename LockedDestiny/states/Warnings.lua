local lightTime = 0
local lightFading = false
local lightReady = false

local musicFading = false

function onCreate()
    playMenuMusic('Light', 1, true)

    warning1 = true
    warning2 = false
    warning3 = false

    BGSprite('lig2', 'Menu/Menu0/light2', 0, 175, 0, 0)
    scale('lig2', 1, 1)
    screenCenter('lig2')
    set('lig2.alpha', 0)
    add('lig2')

    doTweenAlpha('lig2Appear', 'lig2', 0.50, 0.3, 'linear')
    runTimer('lightStart', 0.3)

    BGSprite('lig', 'Menu/Menu0/light', 0, 175, 0, 0)
    scale('lig', 1, 1)
    screenCenter('lig')
    add('lig')

    BGSprite('warn', 'Menu/Menu0/tex1', 0, 175, 0, 0)
    scale('warn', 0.8, 0.8)
    screenCenter('warn')
    setBlendMode('warn', 'ADD')
    set('warn.alpha', 0)
    set('warn.x', get('warn.x') - 2000)
    add('warn')

    BGSprite('warn2', 'Menu/Menu0/tex2', 0, 175, 0, 0)
    scale('warn2', 0.8, 0.8)
    screenCenter('warn2')
    setBlendMode('warn2', 'ADD')
    set('warn2.alpha', 0)
    set('warn2.x', get('warn2.x') + 2000)
    add('warn2')

    BGSprite('warn3', 'Menu/Menu0/tex3', 0, 175, 0, 0)
    scale('warn3', 0.8, 0.8)
    screenCenter('warn3')
    setBlendMode('warn3', 'ADD')
    set('warn3.alpha', 0)
    set('warn3.x', get('warn3.x') - 2000)
    add('warn3')

    setArray({'warn2.visible', 'warn3.visible'}, false)

    doTweenX('warn', 'warn', get('warn.x') + 2000, 0.6, 'elasticout')
    doTweenAlpha('warnAlpha', 'warn', 1, 2)
end


function onUpdate(elapsed)
    if lightReady and not lightFading then
        lightTime = lightTime + elapsed

        local flicker = 0.68
            + math.sin(lightTime * 12) * 0.10
            + math.sin(lightTime * 19) * 0.06

        local glitch = math.sin(lightTime * 12)

        if glitch > 0.96 then
            flicker = flicker * 0.65

        elseif glitch < -0.98 then
            flicker = flicker * 0.75
        end

        flicker = math.max(0.45, math.min(0.80, flicker))
        set('lig2.alpha', flicker)
    end

    if not keyJustPressed('accept') then
        return
    end

    if warning1 == true then
        doTweenY('warnOut','warn',get('warn.y') + 500,0.5,'quadIn')
        doTweenAlpha('warnOutAlpha','warn',0,0.5)

        playSound('confirmMenu')
        set('warn2.visible', true)

        doTweenX('warn2','warn2', get('warn2.x') - 2000,0.6,'elasticout')
        doTweenAlpha('warn2Alpha','warn2',1,2)
        warning1 = false
        warning2 = true

    elseif warning2 == true then
        doTweenY('warn2Out','warn2', get('warn2.y') + 500,0.5,'quadIn')
        doTweenAlpha('warn2OutAlpha','warn2',0,0.5)

        playSound('confirmMenu')
        set('warn3.visible', true)

        doTweenX('warn3','warn3', get('warn3.x') + 2000,0.6,'elasticout')
        doTweenAlpha('warn3Alpha','warn3',1,2)
        warning2 = false
        warning3 = true

    elseif warning3 == true then
        doTweenY('warn3Out','warn3',get('warn3.y') + 500,0.5,'quadIn')
        doTweenAlpha('warn3OutAlpha','warn3',0,0.5)
        playSound('confirmMenu')

        lightFading = true
        musicFading = true

        doTweenAlpha('lig2Fade','lig2',0,0.5)
        doTweenAlpha('ligFade','lig',0,0.5)

        runHaxeCode([[if (FlxG.sound.music != null){FlxTween.tween(FlxG.sound.music,{volume: 0},0.5);}]])

        runTimer('goMenu', 0.5)

        warning3 = false

    end
end

function onTimerCompleted(tag)
    if tag == 'lightStart' then

        lightReady = true

    elseif tag == 'goMenu' then
        switchLuaMenu('TitleState')
    end
end
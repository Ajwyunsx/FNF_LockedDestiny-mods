local canDoIdleShit = false

local gfDefaultX = 1
local gfDefaultY = 1

local shaderTime = 0

function onCreatePost()
    gfDefaultX = get('gf.scale.x')
    gfDefaultY = get('gf.scale.y')
    makeShader('weirdShader', 'effect weird')
    setSpriteShader('gf', 'weirdShader')
end

function onBeatHit()
    if curBeat % 4 ~= 0 then
        return
    end

    set('gf.scale.x', gfDefaultX + 0.043)
    set('gf.scale.y', gfDefaultY + 0.043)
    doTweenX('gfScaleX','gf.scale',gfDefaultX,0.85,'cubeOut')
    doTweenY('gfScaleY','gf.scale',gfDefaultY,0.85,'cubeOut')
end

function onUpdate(elapsed)
    shaderTime = shaderTime + elapsed
    setShaderFloat('weirdShader', 'iTime', shaderTime)
end

function onMoveCamera(focus, same)
    if not canDoIdleShit then
        return
    end
    if focus == 'dad' then
        if getAnimName('gf') ~= 'idle-dad-loop' then
            playAnim('gf', 'idle-dad', true)
        end
    else
        if getAnimName('gf') ~= 'idle-bf-loop' then
            playAnim('gf', 'idle-bf', true)
        end
    end
end

function onEventSet()
    stepEvent(928, function()
        canDoIdleShit = true
        playAnim('gf', 'idle-dad', true)
    end)

    stepEvent(1311, function()
        canDoIdleShit = false
    end)
end
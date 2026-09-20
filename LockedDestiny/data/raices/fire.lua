p = 0

local fireEnabled = false
local spawnTimer = 0

--config

local minX = 500
local maxX = 1200

local minY = -100
local maxY = 650

local moveLeftMin = 200
local moveLeftMax = 500

local moveDownMin = 150
local moveDownMax = 450

local minScale = 1.0
local maxScale = 2.0

local minTime = 7
local maxTime = 12

local spawnRate = 0.12

local transparentChance = 60


function onEventSet()
    stepEvent({272, 1296}, function()
      fireEnabled = true
    end)

    stepEvent({528, 1498}, function()
     fireEnabled = false
         for i = 1, p do
        doTweenAlpha( 'endFade' .. i, 'fire' .. i, 0, 0.5, 'linear')
    end

    end)
end

function onUpdate(elapsed)

    if not fireEnabled then
        return
    end

    spawnTimer = spawnTimer + elapsed

    if spawnTimer >= spawnRate then

        spawnTimer = 0
        createFire()

    end

end

function createFire()

    p = p + 1

    local tag = 'fire' .. p

    local startX = math.random(minX, maxX)
    local startY = math.random(minY, maxY)

    local scale = math.random(minScale * 100, maxScale * 100) / 100

    local moveLeft = math.random(moveLeftMin, moveLeftMax)
    local moveDown = math.random(moveDownMin, moveDownMax)

    local moveTime = math.random(minTime * 10, maxTime * 10) / 10

    makeLuaSprite(tag, 'raices/FireBlack', startX, startY)
    addAnim(tag, 'Move', 'Loop0', 22, true)
    scroll(tag, 0.3, 0.3)
    scaleObject(tag, scale, scale)
    set(tag .. '.antialiasing', false)
    add(tag, true)
    setOrder(tag, getOrder('weebStreet') - 1)

    local alphaTarget = 1

    if math.random(1,100) <= transparentChance then
        alphaTarget = math.random(25,70) / 100
    end

    set(tag .. '.alpha', 0)
    doTweenAlpha('fadeIn' .. p, tag, alphaTarget, 0.5, 'linear')

    doTweenX( 'moveX' .. p, tag, startX - moveLeft, moveTime, 'linear')
    doTweenY( 'moveY' .. p, tag, startY + moveDown, moveTime, 'linear')

    runTimer('fadeOut' .. p, moveTime - 2.5)

end

function onTimerCompleted(tag)
    if string.find(tag, 'fadeOut') then

        local id = tag:gsub('fadeOut', '')

        doTweenAlpha( 'removeFade' .. id, 'fire' .. id, 0, 2.5, 'linear')

    end
end

function onTweenCompleted(tag)

    if string.find(tag, 'removeFade') then

        local id = tag:gsub('removeFade', '')

        removeLuaSprite('fire' .. id, false)

    end

    if string.find(tag, 'endFade') then

        local id = tag:gsub('endFade', '')

        removeLuaSprite('fire' .. id, false)

    end

end
local isFloating = false
local floatSpeed = 0.86

local floatRangeRight = 600
local floatRangeLeft = -200
local floatRangeUp = -670
local floatRangeDown = -265

local floatTimer = 0
local originalX = 0
local originalY = 0

local tv2OffsetX, tv2OffsetY = -173, -50
local blackOffsetX, blackOffsetY = -595, 140
local staticTVOffsetX, staticTVOffsetY = -547, -283

function onCreatePost()
    originalX = get('dad.x')
    originalY = get('dad.y')
    setOrder('black', getOrder('boyfriendGroup') + 1)
end

function onUpdate(elapsed)
    if isFloating then
        floatTimer = floatTimer + elapsed * floatSpeed

        local offsetX = math.sin(floatTimer) * (floatRangeRight - floatRangeLeft) / 2
        local offsetY = math.cos(floatTimer) * (floatRangeDown - floatRangeUp) / 2

        local centerX = originalX + (floatRangeRight + floatRangeLeft) / 2
        local centerY = originalY + (floatRangeUp + floatRangeDown) / 2

        set('dad.x', centerX + offsetX)
        set('dad.y', centerY + offsetY)

        set('tv2.x', get('dad.x') + tv2OffsetX)
        set('tv2.y', get('dad.y') + tv2OffsetY)
        set('black.x', get('dad.x') + blackOffsetX)
        set('black.y', get('dad.y') + blackOffsetY)
        set('StaticTV.x', get('dad.x') + staticTVOffsetX)
        set('StaticTV.y', get('dad.y') + staticTVOffsetY)
    end
end

function onEventSet()
    stepEvent(1608, function()
        moveDadTo(600, 400)
        startFloating()
    end)

    stepEvent(2120, function()
        stopFloatingAndReset()
    end)
end

function startFloating()
    isFloating = true
    floatTimer = 0
end

function stopFloating()
    isFloating = false
    set('dad.x', originalX)
    set('dad.y', originalY)
end

function stopFloatingAndReset()
    isFloating = false
    set('dad.x', originalX)
    set('dad.y', originalY)

    set('tv2.x', originalX + tv2OffsetX)
    set('tv2.y', originalY + tv2OffsetY)
    set('black.x', originalX + blackOffsetX)
    set('black.y', originalY + blackOffsetY)
    set('StaticTV.x', originalX + staticTVOffsetX)
    set('StaticTV.y', originalY + staticTVOffsetY)
end

function moveDadTo(newX, newY)
    set('dad.x', newX)
    set('dad.y', newY)
    originalX = newX
    originalY = newY
end
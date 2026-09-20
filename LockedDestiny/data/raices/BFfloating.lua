local isFloating = false
local floatSpeed = 1
local floatRangeX = 50
local floatRangeY = 30
local floatTimer = 0
local originalX = 0
local originalY = 0
local initialX = 0
local initialY = 0

function onCreatePost()
    initialX = get('boyfriend.x')
    initialY = get('boyfriend.y')
    
    originalX = initialX
    originalY = initialY
end

function onUpdate(elapsed)
    if isFloating then
        floatTimer = floatTimer + elapsed * floatSpeed

        local offsetX = math.sin(floatTimer) * floatRangeX
        local offsetY = math.cos(floatTimer) * floatRangeY

        set('boyfriend.x', originalX + offsetX)
        set('boyfriend.y', originalY + offsetY)
    else
        local currentX = get('boyfriend.x')
        local currentY = get('boyfriend.y')
        if currentX ~= originalX or currentY ~= originalY then
            originalX = currentX
            originalY = currentY
        end
    end
end

function onEventSet()
    stepEvent(528, function()
        moveBoyfriendTo(300, 500)
        startFloating()
    end)

    stepEvent(1040, function()
        stopFloatingAndReset()
    end)
end

function startFloating()
    isFloating = true
    floatTimer = 0
end

function stopFloating()
    isFloating = false
    set('boyfriend.x', originalX)
    set('boyfriend.y', originalY)
end

function stopFloatingAndReset()
    isFloating = false
    set('boyfriend.x', initialX)
    set('boyfriend.y', initialY)
end

function moveBoyfriendTo(newX, newY)
    set('boyfriend.x', newX)
    set('boyfriend.y', newY)
    originalX = newX
    originalY = newY
end
local isLooping = false
local fadeSpeed = 0.5
local fadeDirection = 1
local spriteName = 'bfs'
local maxAlpha = 0.7
local minAlpha = 0

function onUpdate(elapsed)

    if get('bfs.x') >= -405 then
        set('bfs.x', -520)
    end

    if get('bfs.y') <= -361 then
        set('bfs.y', -200)
    end

    set('bfs.x', get('bfs.x') + 1)
    set('bfs.y', get('bfs.y') - 1)

    if isLooping then
        local currentAlpha = get(spriteName .. '.alpha')
        local newAlpha = currentAlpha + (fadeSpeed * fadeDirection * elapsed)

        if newAlpha >= maxAlpha then
            newAlpha = maxAlpha
            fadeDirection = -1

        elseif newAlpha <= minAlpha then
            newAlpha = minAlpha
            fadeDirection = 1
        end

        set(spriteName .. '.alpha', newAlpha)
    end
end


function onEventSet()

    stepEvent(784, function()
        isLooping = true
    end)

    stepEvent(1040, function()
        isLooping = false
        set(spriteName .. '.alpha', minAlpha)
    end)

end
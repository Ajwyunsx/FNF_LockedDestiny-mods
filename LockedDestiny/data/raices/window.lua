local shit = false

function onCreatePost()
    setVar('canCustomPause', true)
end

function onUpdate()
    if shit == true then
        isFullscreen(false)
    end
end

function onEventSet()
    stepEvent(1552, function()
        setVar('canCustomPause', false)
        set('canPause', false)
    end)

    stepEvent(1608, function()
        shit = true
    end)

    stepEvent(2120, function()
        setVar('canCustomPause', true)
        set('canPause', true)
    end)

end
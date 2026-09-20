function onCreate()
makeTrailSpirit('dadTrailSpirit', 'dad', '#FFFFFF')
trailDirection('dadTrailSpirit', 'follow')
trailSpeed('dadTrailSpirit', 100)
trailDelay('dadTrailSpirit', 0.1)
trailAlpha('dadTrailSpirit', 0.2)
trailLife('dadTrailSpirit', 1)
add('dadTrailSpirit')
end

function onEventSet()
    stepEvent(1608, function()
        remove('dadTrailSpirit')
    end)
end
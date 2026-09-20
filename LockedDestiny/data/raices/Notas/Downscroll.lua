local rotationAngles = {}

function onCreate()
    runTimer('tween', 0.5)
end

function onTimerCompleted(tag)

    if tag == 'tween' then

        noteTweenX('susOp', 4, 732, 0.0005)
        noteTweenX('susOp2', 5, 844, 0.0005)
        noteTweenX('susOp3', 6, 957, 0.0005)
        noteTweenX('susOp4', 7, 1069, 0.0005)

        noteTweenX('sus', 0, 89, 0.0005)
        noteTweenX('sus2', 1, 201, 0.0005)
        noteTweenX('sus3', 2, 314, 0.0005)
        noteTweenX('sus4', 3, 427, 0.0005)

    end

end

function onEventSet()

    stepEvent(1560, function()
        setStrumPos('player', -270, 520)

    end)

    stepEvent(1608, function()
        noteTweenX('left1', 4, 40, 0.5, 'ExpoOut')
        noteTweenX('left2', 5, 200, 0.5, 'ExpoOut')

        noteTweenX('right1', 6, 970, 0.5, 'ExpoOut')
        noteTweenX('right2', 7, 1120, 0.5, 'ExpoOut')
    end)

    stepEvent(1860, function()

        set('defaultCamHUDZoom', 0.65)

        noteTweenX('1', 4, 510, 0.3, 'ExpoIn')
        noteTweenY('1Y', 4, 340, 0.3, 'ExpoIn')

        noteTweenX('2', 6, 610, 0.3, 'ExpoIn')
        noteTweenY('2Y', 6, 240, 0.3, 'ExpoIn')

        noteTweenX('3', 5, 610, 0.3, 'ExpoIn')
        noteTweenY('3Y', 5, 440, 0.3, 'ExpoIn')

        noteTweenX('4', 7, 710, 0.3, 'ExpoIn')
        noteTweenY('4Y', 7, 340, 0.3, 'ExpoIn')

        noteTweenDirection('BFLEFT', 4, 0, 0.3, 'ExpoIn')
        noteTweenDirection('BFDOWN', 5, 270, 0.3, 'ExpoIn')
        noteTweenDirection('BFUP', 6, 90, 0.3, 'ExpoIn')
        noteTweenDirection('BFRIGHT', 7, 180, 0.3, 'ExpoIn')

        for i = 4, 7 do
            rotationAngles[i] = 0
        end
    end)
end

function onUpdate(elapsed)

    for i = 4, 7 do
        if rotationAngles[i] ~= nil then

            rotationAngles[i] = rotationAngles[i] + (200 * elapsed)
            setNoteAngle(i, rotationAngles[i])
        end
    end
end
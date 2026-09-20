function onCreate()

    runTimer('tween', 0.5)

end

function onTimerCompleted(tag)

    if tag == 'tween' then

noteTweenX('sus', 4, 732, 0.0005)
noteTweenX('sus2', 5, 844, 0.0005)
noteTweenX('sus3', 6, 957, 0.0005)
noteTweenX('sus4', 7, 1069, 0.0005)

noteTweenX('susOp', 0, 89, 0.0005)
noteTweenX('susOp2', 1, 201, 0.0005)
noteTweenX('susOp3', 2, 314, 0.0005)
noteTweenX('susOp4', 3, 427, 0.0005)

    end

end
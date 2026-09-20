local hideTimer = false

function onEvent(name, v1, v2)
    if name == 'HideHUDchain' then
        local alpha = tonumber(v1) or 0
        local time = tonumber(v2) or 0.5
        local show = alpha == 1

        if time <= 0 then
            set('HealtBG.alpha', alpha)
            set('daHealth.alpha', alpha)
            set('iconP1.alpha', alpha)
            set('iconP2.alpha', alpha)

            strumTweenAlpha('notesAlpha', 'all', alpha, 0.0001)

            set('timer.alpha', alpha)
            set('timerBG.alpha', alpha)
            set('timerSprite.alpha', alpha)
        else
            doTweenAlpha('hb1', 'HealtBG', alpha, time, 'linear')
            doTweenAlpha('hb2', 'daHealth', alpha, time, 'linear')
            doTweenAlpha('ic1', 'iconP1', alpha, time, 'linear')
            doTweenAlpha('ic2', 'iconP2', alpha, time, 'linear')

            strumTweenAlpha('notesAlpha', 'all', alpha, time)

            doTweenAlpha('t1', 'timer', alpha, time, 'linear')
            doTweenAlpha('t2', 'timerBG', alpha, time, 'linear')
            doTweenAlpha('t3', 'timerSprite', alpha, time, 'linear')
        end

        if not show then
            runTimer('killTimer', math.max(time, 0.01))
        else
            set('timer.visible', true)
            set('timerBG.visible', true)
            set('timerSprite.visible', true)
        end

        hideTimer = not show
    end
end

function onTimerCompleted(tag)
    if tag == 'killTimer' then
        set('timer.visible', false)
        set('timerBG.visible', false)
        set('timerSprite.visible', false)
    end
end
function onCreate()

    makeLuaSprite('notificationBG', 'raices/bait', 300, 80)
    scaleObject('notificationBG', 0.75, 0.75)
    setCam('notificationBG', 'other')
    set('notificationBG.alpha', 0)
    add('notificationBG', true)

    -- TITULO
    makeLuaText('notificationTitle', '', 0, 0, 20, 280)
    setTextFont('notificationTitle', 'segoeui')
    setTextColor('notificationTitle', 'FFFFFF')
    setTextAlign('notificationTitle', 'left')
    setCam('notificationTitle', 'other')
    set('notificationTitle.alpha', 0)
    add('notificationTitle', true)

    -- MENSAJE
    makeLuaText('notificationMessage', '', 0, 0, 16, 280)
    setTextFont('notificationMessage', 'segoeui')
    setTextColor('notificationMessage', 'FFFFFF')
    setTextAlign('notificationMessage', 'left')
    setCam('notificationMessage', 'other')
    set('notificationMessage.alpha', 0)
    add('notificationMessage', true)

    preloadSound('NotiSound')
end

function onEvent(eventName, value1, value2)

    if eventName == 'show_notification' then

        local title = value1
        local message = value2

        if title == nil or title == '' then
            title = 'Notification'
        end

        if message == nil or message == '' then
            message = 'This is a test message.'
        end

        setText('notificationTitle', title)
        setText('notificationMessage', message)

        local screenWidth = getPropertyFromClass('flixel.FlxG', 'width')
        local screenHeight = getPropertyFromClass('flixel.FlxG', 'height')

        local notifWidth = 300
        local notifHeight = 80

        local finalX = screenWidth - notifWidth - 57
        local startX = screenWidth + 350

        set('notificationBG.x', startX)
        set('notificationBG.y', screenHeight - notifHeight - 58)

        set('notificationTitle.x', startX + 45)
        set('notificationTitle.y', get('notificationBG.y') + 12)

        set('notificationMessage.x', startX + 45)
        set('notificationMessage.y', get('notificationBG.y') + 39)

        set('notificationTitle.visible', true)
        set('notificationMessage.visible', true)

        doTweenX('notifBG_in', 'notificationBG', finalX, 0.4, 'quadOut')
        doTweenAlpha('notifBG_alpha', 'notificationBG', 1, 0.4, 'linear')

        doTweenX('notifTitle_in', 'notificationTitle', finalX + 45, 0.4, 'quadOut')
        doTweenAlpha('notifTitle_alpha', 'notificationTitle', 1, 0.4, 'linear')

        doTweenX('notifMessage_in', 'notificationMessage', finalX + 45, 0.4, 'quadOut')
        doTweenAlpha('notifMessage_alpha', 'notificationMessage', 1, 0.4, 'linear')

        playSound('NotiSound', 0.35)

        runTimer('hide_notification', 3)
    end
end

function onTimerCompleted(tag)

    if tag == 'hide_notification' then

        local exitX = getPropertyFromClass('flixel.FlxG', 'width') + 400

        doTweenX('notifBG_out', 'notificationBG', exitX, 0.8, 'quadIn')
        doTweenAlpha('notifBG_outAlpha', 'notificationBG', 0, 0.4, 'linear')

        doTweenX('notifTitle_out', 'notificationTitle', exitX + 28, 0.8, 'quadIn')
        doTweenAlpha('notifTitle_outAlpha', 'notificationTitle', 0, 0.4, 'linear')

        doTweenX('notifMessage_out', 'notificationMessage', exitX + 28, 0.8, 'quadIn')
        doTweenAlpha('notifMessage_outAlpha', 'notificationMessage', 0, 0.4, 'linear')
    end
end
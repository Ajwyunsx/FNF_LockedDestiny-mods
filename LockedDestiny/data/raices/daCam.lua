function onCreate()
movecam = true
end


function onUpdate()
if movecam == true then  -------da shit
MoveCamOnAnim(0, 'idle', 0, 0)
MoveCamOnAnim(0, 'singRIGHT', -30, 0)
MoveCamOnAnim(0, 'singDOWN', 0, 30)
MoveCamOnAnim(0, 'singUP', 0, -40)
MoveCamOnAnim(0, 'singLEFT', 45, 0)

MoveCamOnAnim(1, 'idle', 0, 0)
MoveCamOnAnim(1, 'singLEFT', -30, 0)
MoveCamOnAnim(1, 'singDOWN', 0, 30)
MoveCamOnAnim(1, 'singUP', 0, -40)
MoveCamOnAnim(1, 'singRIGHT', 45, 0)
end

if movecam == false then  -----Reset Cam Offset
MoveCamOnAnim(0, 'idle', 0, 0)
MoveCamOnAnim(0, 'singRIGHT', 0, 0)
MoveCamOnAnim(0, 'singDOWN', 0, 0)
MoveCamOnAnim(0, 'singUP', 0, 0)
MoveCamOnAnim(0, 'singLEFT', 0, 0)

MoveCamOnAnim(1, 'idle', 0, 0)
MoveCamOnAnim(1, 'singLEFT', 0, 0)
MoveCamOnAnim(1, 'singDOWN', 0, 0)
MoveCamOnAnim(1, 'singUP', 0, 0)
MoveCamOnAnim(1, 'singRIGHT', 0, 0)
end
end

function onEventSet()
    stepEvent(1608, function()
        movecam = false
    end)
end

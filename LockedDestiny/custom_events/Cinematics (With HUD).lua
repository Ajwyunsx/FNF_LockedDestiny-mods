--Created by RamenDominoes (Please credit if using this, thanks! <3)

function onCreatePost()

    makeLuaSprite('UpperBar(With HUD)', 'empty', -110, -500)
	makeGraphic('UpperBar(With HUD)', 2000, 500, '000000')
	setCam('UpperBar(With HUD)', 'camHUD')
	add('UpperBar(With HUD)', false)

    makeLuaSprite('LowerBar(With HUD)', 'empty', -110, 720)
	makeGraphic('LowerBar(With HUD)', 2000, 500, '000000')
	setCam('LowerBar(With HUD)', 'camHUD')
	add('LowerBar(With HUD)', false)
    setOrder('spikes', getOrder('UpperBar(With HUD)') - 1)

    UpperBar = get('UpperBar(With HUD).y')
	LowerBar = get('LowerBar(With HUD).y')

    for Notes = 0,7 do 
        StrumY = getPropertyFromGroup('strumLineNotes', Notes, 'y')
    end
end

function onEvent(name, value1, value2)
	
	if name == 'Cinematics (With HUD)' then
	
		Speed = tonumber(value1)
		Distance = tonumber(value2)

--ENTRANCES

		if Speed and Distance > 0 then

			doTweenY('With HUD1', 'UpperBar(With HUD)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('With HUD2', 'LowerBar(With HUD)', LowerBar - Distance, Speed, 'QuadOut')

		end

		if downscroll and Speed and Distance > 0 then
		
			doTweenY('With HUD1', 'UpperBar(With HUD)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('With HUD2', 'LowerBar(With HUD)', LowerBar - Distance, Speed, 'QuadOut')

		end

		if Distance <= 0 then

			doTweenY('With HUD1', 'UpperBar(With HUD)', UpperBar, Speed, 'QuadIn')
			doTweenY('With HUD2', 'LowerBar(With HUD)', LowerBar, Speed, 'QuadIn')

		end	
	end
end

local BG = {'BG', 'BG0', 'BG1', 'BG2', 'BG3', 'BG4', 'Sky', 'clouds', 'Particles1', 'Smoke', 'Particles2', 'Overlay'}
local charShader = {'dad', 'boyfriend'}
function onCreate()
	initLuaShader('impact_frames')
end

function onUpdatePost()
	if curStage == 'ruinsExit' then
		BG = {'BG1', 'BG2', 'BG3', 'Sky'}
		charShader = {'dad', 'boyfriend'}
	end
	if curStage == 'heat' then
		BG = {'Sky', 'BG4'}
	end
end

function onEvent(n,v1,v2)
    if n == "ImpactFrame" then
		if v1 == '1' then
			if curStage == 'heat' then
				setSpriteShader('front', 'impact_frames')
			    setShaderFloat('front', 'threshold', 1)
			end
	        for i = 1, #charShader do
                local name = charShader[i]
                setSpriteShader(name, 'impact_frames')
			    setShaderFloat(name, 'threshold', 0.5)
            end
	        for i = 1, #BG do
                local name2 = BG[i]
                setProperty(name2..'.visible', false)
            end
	    end
		if v1 == '0' then
			if curStage == 'heat' then
				removeSpriteShader('front')
			end
	        for i = 1, #charShader do
                local name = charShader[i]
                removeSpriteShader(name)
            end
	        for i = 1, #BG do
                local name2 = BG[i]
                setProperty(name2..'.visible', true)
            end
		end
    end

end
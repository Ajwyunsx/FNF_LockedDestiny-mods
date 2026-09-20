function onCreatePost()
    -- STAGE
    makeShader('colorBG', 'ColorCorrection')

    setSpriteShader('wall', 'colorBG')
    setSpriteShader('photos', 'colorBG')
    setSpriteShader('photos2', 'colorBG')
    setSpriteShader('floor', 'colorBG')
    setSpriteShader('cam', 'colorBG')
    setSpriteShader('Border', 'colorBG')
    setSpriteShader('TVG', 'colorBG')

    setVarArray({'bgBright', 'bgHue', 'bgSat', 'bgContrast'},{0, 0, 0, 0})

    -- OPONENTE
    makeShader('colorDad', 'ColorCorrection')
    setSpriteShader('dad', 'colorDad')
    setVarArray({'dadBright', 'dadHue', 'dadSat', 'dadContrast'},{0, 0, 0, 0})

    -- PLAYER
    makeShader('colorBF', 'ColorCorrection')
    setSpriteShader('boyfriend', 'colorBF')
    setVarArray({'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{0, 0, 0, 0})

    -- SPIKES
    makeShader('waveSpikes', 'waveSpikes')
    setSpriteShader('spikes', 'waveSpikes')

    setShaderFloat('waveSpikes', 'uSpeed', 2.0)
    setShaderFloat('waveSpikes', 'uFrequency', 15.0)
    setShaderFloat('waveSpikes', 'uWaveAmplitude', 0.01)

    -- TUNNEL
    makeShader('tunnel', 'Tunnel')
    setSpriteShader('faces', 'tunnel')

    lastBG = {}
    lastDad = {}
    lastBF = {}
end

function onUpdate()
    -- STAGE
    local bgBright = getVar('bgBright')
    local bgHue = getVar('bgHue')
    local bgSat = getVar('bgSat')
    local bgContrast = getVar('bgContrast')

    if lastBG[1] ~= bgBright then
        setShaderFloat('colorBG', 'brightness', bgBright)
        lastBG[1] = bgBright
    end

    if lastBG[2] ~= bgContrast then
        setShaderFloat('colorBG', 'contrast', bgContrast)
        lastBG[2] = bgContrast
    end

    if lastBG[3] ~= bgHue then
        setShaderFloat('colorBG', 'hue', bgHue)
        lastBG[3] = bgHue
    end

    if lastBG[4] ~= bgSat then
        setShaderFloat('colorBG', 'saturation', bgSat)
        lastBG[4] = bgSat
    end

    -- OPONENT
    local dadBright = getVar('dadBright')
    local dadHue = getVar('dadHue')
    local dadSat = getVar('dadSat')
    local dadContrast = getVar('dadContrast')

    if lastDad[1] ~= dadBright then
        setShaderFloat('colorDad', 'brightness', dadBright)
        lastDad[1] = dadBright
    end

    if lastDad[2] ~= dadContrast then
        setShaderFloat('colorDad', 'contrast', dadContrast)
        lastDad[2] = dadContrast
    end

    if lastDad[3] ~= dadHue then
        setShaderFloat('colorDad', 'hue', dadHue)
        lastDad[3] = dadHue
    end

    if lastDad[4] ~= dadSat then
        setShaderFloat('colorDad', 'saturation', dadSat)
        lastDad[4] = dadSat
    end

    -- PLAYER
    local bfBright = getVar('bfBright')
    local bfHue = getVar('bfHue')
    local bfSat = getVar('bfSat')
    local bfContrast = getVar('bfContrast')

    if lastBF[1] ~= bfBright then
        setShaderFloat('colorBF', 'brightness', bfBright)
        lastBF[1] = bfBright
    end

    if lastBF[2] ~= bfContrast then
        setShaderFloat('colorBF', 'contrast', bfContrast)
        lastBF[2] = bfContrast
    end

    if lastBF[3] ~= bfHue then
        setShaderFloat('colorBF', 'hue', bfHue)
        lastBF[3] = bfHue
    end

    if lastBF[4] ~= bfSat then
        setShaderFloat('colorBF', 'saturation', bfSat)
        lastBF[4] = bfSat
    end

    local time = getSongPosition() / 1000

    setShaderFloat('tunnel', 'iTime', time)
    setShaderFloat('waveSpikes', 'uTime', time)
end

function onEventSet()
    stepEvent(800, function()
        doTweenFloatArray('bgEffect',{'bgHue', 'bgSat', 'bgContrast'},{90, -5, 27},2,'quartOut')
        doTweenFloatArray('dadEffect',{'dadHue', 'dadSat', 'dadContrast'},{50, 46, 14},2,'quartOut')
        doTweenFloatArray('bfEffect',{'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{-24, 20, 45, 5},2,'quartOut')
        doTweenAlpha('redlay', 'redlay', 0.40, 2, 'linear')
    end)

    stepEvent(1184, function()
        doTweenFloatArray('bgReset',{'bgHue', 'bgSat', 'bgContrast'},{0, 0, 0},2,'quartOut')
        doTweenFloatArray('dadReset',{'dadHue', 'dadSat', 'dadContrast'},{0, 0, 0},2,'quartOut')
        doTweenFloatArray('bfReset',{'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{0, 0, 0, 0},2,'quartOut')
        doTweenAlpha('redlay', 'redlay', 0, 2, 'linear')
    end)

    stepEvent(1240, function()
        doTweenFloatArray('bgEffect',{'bgHue', 'bgSat', 'bgContrast'},{90, -5, 27},0.1,'quartOut')
        doTweenFloatArray('dadEffect',{'dadHue', 'dadSat', 'dadContrast'},{50, 46, 14},0.1,'quartOut')
        doTweenFloatArray('bfEffect',{'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{-24, 20, 45, 5},0.1,'quartOut')
        doTweenAlpha('redlay', 'redlay', 0.40, 1, 'linear')
    end)

    stepEvent(1808, function()
        doTweenFloatArray('dadToNormal',{'dadBright', 'dadHue', 'dadSat', 'dadContrast'},{0, 0, 0, 0},0.2,'linear')
        doTweenFloatArray('bfToNormal',{'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{0, 0, 0, 0},0.2,'linear')
    end)

    stepEvent(1824, function()
        cancelTween('dadToNormal')
        cancelTween('bfToNormal')
        setVarArray({'dadBright', 'dadHue', 'dadSat', 'dadContrast'},{-17, 20, 40, 35})
        setVarArray({'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{-17, 20, 40, 75})
    end)

    stepEvent(1964, function()
        setVarArray({'dadBright', 'dadHue', 'dadSat', 'dadContrast'},{0, 50, 46, 14})
        setVarArray({'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{-24, 20, 45, 5})
    end)

    stepEvent(2080, function()
        doTweenFloatArray('bfToNormal',{'bfBright', 'bfHue', 'bfSat', 'bfContrast'},{-43, -13, -63, 0},2,'linear')
    end)
end
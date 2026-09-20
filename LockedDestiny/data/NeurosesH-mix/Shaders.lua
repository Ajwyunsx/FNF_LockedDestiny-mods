local dizzyCam = false
local dizzyIntensity = 0
local dizzyFade = false

local radialIntensity = 0

local lastHigh = nil
local lastChromAlpha = nil
local lastGlitchAlpha = nil
local lastColBright = nil
local lastColHue = nil
local lastColSat = nil
local lastColContrast = nil
local lastDizzyIntensity = nil
local lastRadial = nil

-- CAMERA ROTATION
function onTweenCompleted(tag)

    if tag == 'camGameRight' and dizzyCam then
        doTweenAngle('camGameLeft', 'camGame', -8, 2.2, 'sineInOut')
    end

    if tag == 'camGameLeft' and dizzyCam then
        doTweenAngle('camGameRight', 'camGame', 8, 2.2, 'sineInOut')
    end

end

function onCreatePost()

    -- BLOOM
    makeShader('bloom', 'bloom')
    makeShader('bloomBorder', 'bloom')
    setSpriteShader('Border', 'bloomBorder')

    -- SHADERS
    makeShader('chrom', 'demon_blur')
    makeShader('chromToggle', 'chromabber1')
    makeShader('blur', 'blurcam')
    makeShader('wave', 'perspective1')
    makeShader('color', 'ColorCorrection')
    makeShader('glitchN', 'glitchN')
    makeShader('dizzy', 'dizzy')
    makeShader('radial', 'radial')

    setCameraShader('game', {'chrom','chromToggle','blur','wave','color','bloom','glitchN','dizzy','radial'})

    setVarArray({'glitchAlpha'}, {0})

    setVarArray({'colBright', 'colHue', 'colSat', 'colContrast'},{0, 0, 0, 0})

    setVarArray({'chromAlpha'}, {0.56})

    setVarArray({'high'}, {0})

    setVarArray({'radial'}, {0})

    setShaderFloat('chrom', 'u_size', 0.45)

    setShaderFloat('chromToggle', 'amount', 3.5)

    setShaderFloat('blur', 'strength', 1.2)
    setShaderFloat('blur', 'cx', 0.42)
    setShaderFloat('blur', 'cy', 0.48)
    setShaderFloat('blur', 'radius', 0.14)

    setShaderFloat('radial', 'centerX', 0.4)
    setShaderFloat('radial', 'centerY', 0.2)

end

function onUpdate(elapsed)

    -- DIZZY FADE
    if dizzyFade then

        dizzyIntensity = dizzyIntensity - elapsed * 0.4

        if dizzyIntensity <= 0 then
            dizzyIntensity = 0
            dizzyFade = false
        end
    end

    local songTime = getSongPosition() / 1000

    -- BLOOM
    local high = getVar('high')

    if high ~= lastHigh then
        setShaderFloat('bloom', 'Intensity', high)
        setShaderFloat('bloomBorder', 'Intensity', high)
        lastHigh = high
    end

    -- CHROM
    local chromAlpha = getVar('chromAlpha')

    if chromAlpha ~= lastChromAlpha then
        setShaderFloat('chrom', 'u_alpha', chromAlpha)
        lastChromAlpha = chromAlpha
    end

    -- COLOR CORRECTION
    local colBright = getVar('colBright')
    local colHue = getVar('colHue')
    local colSat = getVar('colSat')
    local colContrast = getVar('colContrast')

    if colBright ~= lastColBright then
        setShaderFloat('color', 'brightness', colBright)
        lastColBright = colBright
    end

    if colHue ~= lastColHue then
        setShaderFloat('color', 'hue', colHue)
        lastColHue = colHue
    end

    if colSat ~= lastColSat then
        setShaderFloat('color', 'saturation', colSat)
        lastColSat = colSat
    end

    if colContrast ~= lastColContrast then
        setShaderFloat('color', 'contrast', colContrast)
        lastColContrast = colContrast
    end

    -- GLITCH
    setShaderFloat('glitchN', 'iTime', songTime)

    local glitchAlpha = getVar('glitchAlpha')

    if glitchAlpha ~= lastGlitchAlpha then
        setShaderFloat('glitchN','glitchAlpha',glitchAlpha)
        lastGlitchAlpha = glitchAlpha
    end

    -- WAVE
    setShaderFloat('wave', 'iTime', songTime)

    -- DIZZY SHADER
    setShaderFloat('dizzy', 'iTime', songTime)

    if dizzyIntensity ~= lastDizzyIntensity then
        setShaderFloat('dizzy','intensity',dizzyIntensity)
        lastDizzyIntensity = dizzyIntensity
    end

    -- RADIAL
    local radial = getVar('radial')

    if radial ~= lastRadial then
        setShaderFloat('radial','strength',radial)
        lastRadial = radial
    end
end

function onEventSet()
    -- FLASH
    stepEvent({288, 800, 1248, 1568}, function()
        set('Border.alpha', 1.8)
        cancelTween('bloom')
        setVarArray({'high'}, {1.1})
    end)

    stepEvent({289, 417, 545, 673, 801, 929, 1057, 1249, 1313, 1441, 1569, 1825, 1953, 2081}, function()
        doTweenAlpha('BorderGone','Border',0.2,1.5,'sineOut')
        doTweenFloatArray('bloom',{'high'},{0},(stepCrochet / 1000) * 32,'quartOut')
    end)

    stepEvent({416, 544, 672, 928, 1056, 1184, 1312, 1440, 1952, 2080}, function()
        set('Border.alpha', 0.9)
        cancelTween('bloom')
        setVarArray({'high'}, {0.9})
    end)

    -- DIZZY CAMERA
    stepEvent(1567, function()
        dizzyCam = true
        doTweenAngle('camGameRight','camGame',10,2.2,'sineInOut')
        dizzyIntensity = 0.7
    end)

    stepEvent(1186, function()
        doTweenAlpha('BorderGone','Border',0,1.3,'sineInOut')
    end)

    stepEvent(1760, function()
        dizzyCam = false
        doTweenAngle('camGameRight','camGame',0,1.2,'quadInOut')
        dizzyFade = true
    end)

    stepEvent(1816, function()
        doTweenAlpha('BorderGone','Border',0,1,'sineOut')
    end)

    -- GLITCH / COLOR / RADIAL
    stepEvent(1560, function()
        doTweenFloatArray('radialOut',{'radial'},{0},2,'sineOut')
        cancelTween('glitchOut')
        setVarArray({'glitchAlpha'}, {1})
    end)

    stepEvent(1567, function()
        setVarArray({'colSat'}, {0})
        setVarArray({'glitchAlpha'}, {0})
    end)

    stepEvent(1978, function()
        cancelTween('glitchOut')
        setVarArray({'colSat'}, {-52})
        setVarArray({'glitchAlpha'}, {1})
    end)

    stepEvent(1983, function()
        setVarArray({'colSat'}, {0})
        setVarArray({'glitchAlpha'}, {0})
    end)

    stepEvent(2008, function()
        cancelTween('glitchOut')
        setVarArray({'colSat'}, {-52})
        setVarArray({'glitchAlpha'}, {1})
    end)

    stepEvent(2015, function()
        setVarArray({'colSat'}, {0})
        setVarArray({'glitchAlpha'}, {0})
    end)

    stepEvent(2073, function()
        cancelTween('glitchOut')
        setVarArray({'colSat'}, {-52})
        setVarArray({'glitchAlpha'}, {1})
    end)

    stepEvent(2079, function()
        setVarArray({'colSat'}, {0})
        setVarArray({'glitchAlpha'}, {0})
    end)

    -- CHROM
    stepEvent(2081, function()
        doTweenFloatArray('chromFade',{'chromAlpha'},{0},(stepCrochet / 1000) * 16,'quartOut')
    end)

    -- RADIAL
    stepEvent(290, function()
        doTweenFloatArray('radialOut',{'radial'},{0.95},0.4,'sineOut')
    end)

    stepEvent({802, 1250, 1960}, function()
        doTweenFloatArray('radialOut',{'radial'},{1.1},0.4,'sineOut')
    end)

    stepEvent(1185, function()
        doTweenFloatArray('radialOut',{'radial'},{0},2,'sineOut')
    end)

    stepEvent(2082, function()
        doTweenFloatArray('radialOut',{'radial'},{0},3,'sineOut')
    end)

end
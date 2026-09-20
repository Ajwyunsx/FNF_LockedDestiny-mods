function onCreate()
--Logo scale + position
logoStartX = -1200
logoStartY = 300
logoStartScale = 3.2

logoX = -1190
logoY = -690
logoScale = 0.91

--BGs
playMenuMusic('freakyMenuStart', 0.6, true)

makeLuaSprite('water', 'Menu/Menu1/Floor', -641, 120)
addAnim('water', 'Anim', 'Ocean0', 24, true)
scale('water', 2.12, 2.12)
add('water')

makeLuaSprite('shadow', 'Menu/Menu1/Shadow', -407, 145)
scale('shadow', 1.2, 1.2)
add('shadow')
set('shadow.alpha', 0.30)

makeLuaSprite('bf', 'Menu/Menu1/BFmen', -73, 30)
scale('bf', 0.34, 0.34)
add('bf')

makeLuaSprite('BG', 'Menu/Menu1/BG2', -641, -365)
addAnim('BG', 'Anim', 'BG20', 35, true)
scale('BG', 2.12, 2.12)
setBlendMode('BG', 'ADD')
add('BG')

makeLuaSprite('chains1', 'Menu/Menu1/Chains', 450, -445)
scale('chains1', 1, 1)
add('chains1')

makeLuaSprite('chains2', 'Menu/Menu1/Chains', -670, -445)
scale('chains2', 1, 1)
set('chains2.flipX', true)
add('chains2')

makeLuaSprite('water2', 'Menu/Menu1/Floor2', -641, 300)
scale('water2', 2.12, 2.12)
add('water2')

makeLuaSprite('bubbles', 'Menu/Menu1/Bubbles', 220, -220)
addAnim('bubbles', 'Anim', 'bubbles0', 24, false)
scale('bubbles', 1.7, 1.7)
add('bubbles')
set('bubbles.alpha', 0)

makeLuaSprite('bubbles2', 'Menu/Menu1/Bubbles', -620, -20)
addAnim('bubbles2', 'Anim', 'bubbles0', 24, false)
scale('bubbles2', 1.7, 1.7)
set('bubbles2.flipX', true)
add('bubbles2')
set('bubbles2.alpha', 0)

makeLuaSprite('glitch', 'Menu/Menu1/Glitch', -690, -365)
addAnim('glitch', 'Anim', 'Glitch0', 27, true)
scale('glitch', 3.12, 3.12)
set('glitch.antialiasing', false);
setBlendMode('glitch', 'ADD')
add('glitch')
set('glitch.alpha', 0.15)

makeLuaSprite('overlay', 'Menu/Menu1/Overlay', -650, -360)
scale('overlay', 0.81, 0.81);
setBlendMode('overlay', 'MULTIPLY')
add('overlay')

makeLuaSprite('titleText', 'Menu/Menu1/titleEnter', 473, 298, 0, 0, '')
addAnim('titleText', 'idle', 'ENTER IDLE')
addAnim('titleText', 'press', 'ENTER PRESSED')
playAnim('titleText', 'idle', true)
scale('titleText', 0.3, 0.3)
add('titleText')
set('titleText.alpha', 0)

makeLuaSprite('logo', 'Menu/Menu1/logo', logoStartX, logoStartY)
scale('logo', logoStartScale, logoStartScale)
add('logo')

ColorBox('black', '000000', 0, 0, 0, 0)
add('black')
doTweenAlpha('blackfade', 'black', 0, 2, 'linear')

runTimer('logoIntro', 0.1)
runTimer('ColorShift', 0.1) 
runTimer('alpha shadow2', 3)
end

function startTransitionUp()
local time = 4.4
local ease = 'expoOut'

--mover todo hacia arriba
doTweenY('BG_up', 'BG', get('BG.y') - 1200, time, ease)
doTweenY('water_up', 'water', get('water.y') - 1200, time, ease)
doTweenY('shadow_up', 'shadow', get('shadow.y') - 1200, time, ease)
doTweenY('bf_up', 'bf', get('bf.y') - 1200, time, ease)
doTweenY('chains1_up', 'chains1', get('chains1.y') - 1200, time, ease)
doTweenY('chains2_up', 'chains2', get('chains2.y') - 1200, time, ease)
doTweenY('water2_up', 'water2', get('water2.y') - 1400, time, ease)
doTweenY('glitch_up', 'glitch', get('glitch.y') - 1200, time, ease)
doTweenAlpha('glitch_gone', 'glitch', 0, 0.2, 'linear')
doTweenAlpha('overlay_gone', 'overlay', 0, 2.5, 'linear')
doTweenY('logo_up', 'logo', get('logo.y') - 1200, time, ease)
doTweenY('title_up', 'titleText', get('titleText.y') - 1200, time, ease)

runTimer('showBubbles', 0.2) 
end

local accepted = false

function onUpdate(elapsed)
if keyJustPressed('accept') and not accepted then
accepted = true

cancelTween('color')
cancelTimer('ColorShift')
cancelTimer('ColorShift2')

cancelTween('logoFloatUp')
cancelTween('logoFloatDown')
cancelTween('textFloatUp')
cancelTween('textFloatDown')

cancelTimer('floatUp')
cancelTimer('floatDown')

set('titleText.color', getColorFromHex('FFFFFF'))

playAnim('titleText', 'press', true)
playSound('confirmMenu')
playSound('submerge', 0.2)

startTransitionUp()

runTimer('changeToMain', 1.5)   
end

if keyJustPressed('back') then
--SystemClose() 
switchLuaMenu('Warnings')
end
end

function onTweenCompleted(tag)
if tag == 'logoScaleTween' then
runTimer('startFloat', 0.9)
end
end

function onTimerCompleted(tag)
if tag == 'changeToMain' then
switchLuaMenu('MainMenuState')
end

if tag == 'showBubbles' then
set('bubbles.alpha', 1)
set('bubbles2.alpha', 1)

playAnim('bubbles', 'Anim', true)
playAnim('bubbles2', 'Anim', true)

doTweenY('bubblesUp', 'bubbles', get('bubbles.y') - 600, 1.3, 'sineOut')
doTweenY('bubbles2Up', 'bubbles2', get('bubbles2.y') - 600, 1.3, 'sineOut')
end

--Logo scale + floating
if tag == 'logoIntro' then
doTweenX('logoMoveX', 'logo', logoX, 2.1, 'expoOut')
doTweenY('logoMoveY', 'logo', logoY, 2.1, 'expoOut')
doTweenScale('logoScaleTween', 'logo', logoScale, logoScale, 3.1, 'expoOut')
end

if tag == 'startFloat' then
doTweenAlpha('titleFadeIn', 'titleText', 1, 4.8, 'sineOut')
runTimer('floatUp', 0.01)
end

if tag == 'floatUp' then
doTweenY('logoFloatUp', 'logo', get('logo.y') - 10, 2, 'sineInOut')
doTweenY('textFloatUp', 'titleText', get('titleText.y') - 10, 2, 'sineInOut')

runTimer('floatDown', 2)
end

if tag == 'floatDown' then
doTweenY('logoFloatDown', 'logo', get('logo.y') + 10, 2, 'sineInOut')
doTweenY('textFloatDown', 'titleText', get('titleText.y') + 10, 2, 'sineInOut')

runTimer('floatUp', 2)
end

--Shadow show
if tag== 'alpha shadow' then
doTweenAlpha('shadow', 'shadow', 0.30, 3.7, 'linear')
runTimer('alpha shadow2', 5) 
end

if tag== 'alpha shadow2' then
doTweenAlpha('shadow', 'shadow', 1, 3.7, 'linear')
runTimer('alpha shadow', 3) 
end

--TitleText ColorShift
if tag== 'ColorShift' then
doTweenColor('color', 'titleText', '33FFFF', 2.5, 'linear')
runTimer('ColorShift2', 2.5) 
end

if tag== 'ColorShift2' then
doTweenColor('color', 'titleText', '3333CC', 2.5, 'linear')
runTimer('ColorShift', 2.5) 
end
end
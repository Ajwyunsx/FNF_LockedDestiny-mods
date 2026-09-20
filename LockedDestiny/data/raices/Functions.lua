function onBeatHit()
    if curBeat % 2== 0 then
     objectPlayAnimation('BFG2', 'Move', false)
     objectPlayAnimation('BFG', 'Move', false)
   end
end

function onEventSet()
stepEvent(3, function()
doTweenX('admin x', 'admin.scale', 1.7, 0.001, linear)
doTweenY('admin y', 'admin.scale', 1.7, 0.001, linear)
doTweenZoom('cam1', 'camGame', 3.5, 1.5, linear)
doTweenZoom('cam2', 'camHUD', 3.5, 1.5, linear)
end)

stepEvent(5, function()
    doTweenAlpha('StaticTVAppear', 'StaticTV', 1, 0.5, linear)
end)

stepEvent(16, function()
    set('camZooming', true)
    doTweenZoom('cam1', 'DefaultCamZoom', 0.80, 0.001, linear)
    doTweenZoom('cam2', 'camHUD', 1, 0.001, linear)
    set('scanlines.alpha', 0.16)
    set('weebSky.alpha', 1)
    set('weebSchool.alpha', 1)
    set('weebStreet.alpha', 1)
    set('tv.alpha', 0)
    doTweenAlpha('StaticTV', 'StaticTV', 0, 0.8, QuadOut)
    setBlendMode('StaticTV', 'SCREEN')
end)

stepEvent(272, function()
    set('FlashBF.alpha', 0.80)
    set('weebSchool.alpha', 0)
    set('weebStreet.alpha', 0)
    set('weebSchoolG.alpha', 1)
    set('weebStreetG.alpha', 1)
    set('fire.alpha', 1)
    set('StaticTV.alpha', 0.85)
    setBlendMode('StaticTV', 'SUBTRACT')
    set('FlashBF2.alpha', 0.10)
end)

stepEvent(273, function()
    doTweenAlpha('FlashBFGone', 'FlashBF', 0, 0.8, linear)
    doTweenAlpha('FlashBF2Gone', 'FlashBF2', 0, 0.3, linear)
    doTweenAlpha('StaticTV', 'StaticTV', 0.36, 1.0, linear)
end)

stepEvent({280, 288, 296, 304, 312, 320, 328, 336, 344, 352, 360, 368, 376,
384, 392, 400, 408, 416, 424, 432, 440, 448, 456, 464, 472, 480, 488, 496,
504, 520, 1304, 1312, 1320, 1328, 1336, 1344, 1352, 1360, 1368, 1376, 1384,
1392, 1400, 1408, 1416, 1424, 1432, 1440, 1448, 1456, 1464, 1472, 1480,
1488, 1496}, function()
    set('FlashBF2.alpha', 0.35)
end)

stepEvent({281, 289, 297, 305, 313, 321, 329, 337, 345, 353, 361, 369, 377,
385, 393, 401, 409, 417, 425, 433, 441, 449, 457, 465, 473, 481, 489, 497,
505, 513, 521, 1305, 1313, 1321, 1329, 1337, 1345, 1353, 1361, 1369, 1377,
1385, 1393, 1401, 1409, 1417, 1425, 1433, 1441, 1449, 1457, 1465, 1473,
1481, 1489, 1497}, function()
    doTweenAlpha('FlashBF2Gone', 'FlashBF2', 0, 0.3, linear)
end)

stepEvent(512, function()
    set('FlashBF2.alpha', 0.35)
    strumTweenAlpha('NotesFade', 'all', 0, 0.6)
end)

stepEvent(518, function()
    set('BlackLiquid.alpha', 1)
    objectPlayAnimation('BlackLiquid', 'Move', false)
end)

stepEvent(518, function()
    set('BlackLiquid.alpha', 1)
    objectPlayAnimation('BlackLiquid', 'Move', false)
end)

stepEvent(522, function()
    doTweenZoom('cam1', 'camGame', 3.3, 0.50, linear)
end)

stepEvent(527, function()
    set('ratingX', 4890);
    set('ratingY', 300);
    set('numScoreX', 4890);
    set('numScoreY', 300);
end)

stepEvent(528, function()
  setStrumAlpha('all', 1)
  set('BlackLiquid.alpha', 0)
  set('weebSchool.alpha', 0)
  set('weebStreet.alpha', 0)
  set('weebSchoolG.alpha', 0)
  set('weebStreetG.alpha', 0)
  set('weebStreet2.alpha', 1)
  set('fire.alpha', 0)
  setBlendMode('StaticTV', 'MULTIPLY')
  set('StaticTV.alpha', 0.65)
  set('FlashBF.alpha', 0.80)
  set('FloatingThings.alpha', 1)
end)

stepEvent(529, function()
  doTweenAlpha('FlashBFGone', 'FlashBF', 0, 0.6, linear)
  doTweenAlpha('StaticTVGone', 'StaticTV', 0., 0.6, linear)
end)

stepEvent(784, function()
  set('TextsDeleted1.alpha', 1)
  set('TextsDeleted2.alpha', 1)
  set('TextsDeleted3.alpha', 1)
  set('TextsDeleted4.alpha', 1)
  set('petals.alpha', 1)
  doTweenX('TextsDeleted1TweenX', 'TextsDeleted1', 1280, 7.7, 'linear')
end)

stepEvent({788, 900, 1004}, function()
  doTweenX('TextsDeleted2TweenX', 'TextsDeleted2', 1280, 7.7, 'linear')
end)

stepEvent({799, 911, 1015}, function()
  doTweenX('TextsDeleted3TweenX', 'TextsDeleted3', -715, 7.7, 'linear')
end)

stepEvent({808, 920, 1024}, function()
  doTweenX('TextsDeleted4TweenX', 'TextsDeleted4', -715, 7.7, 'linear')
end)

stepEvent({895, 1000}, function()
  cancelTween('TextsDeleted1TweenX')
  cancelTween('TextsDeleted2TweenX')
  cancelTween('TextsDeleted3TweenX')
  cancelTween('TextsDeleted4TweenX')
  set('TextsDeleted1.x', -715)
  set('TextsDeleted2.x', -715)
  set('TextsDeleted3.x', 1280)
  set('TextsDeleted4.x', 1280)
end)

stepEvent({896, 1001}, function()
  doTweenX('TextsDeleted1TweenX', 'TextsDeleted1', 1280, 7.7, 'linear')
end)

stepEvent(1027, function()
    setBlendMode('StaticTV', 'MULTIPLY')
    doTweenAlpha('StaticTVAppear', 'StaticTV', 0.57, 1.2, linear)
end)

stepEvent(1035, function()
    doTweenZoom('cam1', 'camGame', 3.3, 0.60, linear)
end)

stepEvent(1039, function()
     set('ratingX', 0)
     set('ratingY', 50)
     set('numScoreX', 0)
     set('numScoreY', 50)
end)

stepEvent(1040, function()
  doTweenZoom('cam1', 'DefaultCamZoom', 0.80, 0.001, linear)
  set('TextsDeleted1.alpha', 0)
  set('TextsDeleted2.alpha', 0)
  set('TextsDeleted3.alpha', 0)
  set('TextsDeleted4.alpha', 0)
  set('petals.alpha', 0)
  set('admin.alpha', 1)
  setBlendMode('StaticTV', 'SCREEN')
  set('StaticTV.alpha', 0.73)
  set('FlashBF.alpha', 0.90)
  set('weebSchool.alpha', 1)
  set('weebStreet.alpha', 1)
  set('weebStreet2.alpha', 0)
  set('FloatingThings.alpha', 0)
  doTweenX('admin x', 'admin.scale', 5.5, 5.4, linear)
  doTweenY('admin y', 'admin.scale', 5.5, 5.4, linear)
end)

stepEvent(1041, function()
  doTweenAlpha('adminGone', 'admin', 0, 0.7, linear)
  doTweenAlpha('StaticTVGone', 'StaticTV', 0, 2.5, linear)
  doTweenAlpha('FlashBFGone', 'FlashBF', 0, 0.6, linear)
end)

stepEvent(1296, function()
  set('FlashBF2.alpha', 0.10)
  set('FlashBF.alpha', 0.80)
  set('weebSchool.alpha', 0)
  set('weebStreet.alpha', 0)
  set('weebSchoolG.alpha', 1)
  set('weebStreetG.alpha', 1)
  set('fire.alpha', 1)
  setBlendMode('StaticTV', 'SUBTRACT')
  set('StaticTV.alpha', 0.85)
end)

stepEvent(1297, function()
  doTweenAlpha('FlashBF2Gone', 'FlashBF2', 0, 0.3, linear)
  doTweenAlpha('FlashBFGone', 'FlashBF', 0, 0.8, linear)
  doTweenAlpha('FlashBF2Gone', 'FlashBF2', 0, 0.3, linear)
  doTweenAlpha('StaticTV', 'StaticTV', 0.36, 1.0, linear)
end)

stepEvent(1474, function()
  set('ratingX', 4890);
  set('ratingY', 300);
  set('numScoreX', 4890);
  set('numScoreY', 300);
end)

stepEvent(1498, function()
  set('weebSchool.alpha', 1)
  set('weebStreet.alpha', 1)
  set('weebSchoolG.alpha', 0)
  set('weebStreetG.alpha', 0)
  doTweenAlpha('fireGone', 'fire', 0, 1, linear)
  doTweenAlpha('StaticTV', 'StaticTV', 0, 1, linear)
end)

stepEvent(1529, function()
  set('StaticTV2.scale.x', 5.5)
  set('StaticTV2.scale.y', 5.5)
  doTweenAlpha('StaticTV2', 'StaticTV2', 1, 1.6, linear)
  doTweenAlpha('scanlinesGone', 'scanlines', 0, 0.3, linear)
  doTweenAlpha('tv', 'tv', 1, 0.3, linear)
  set('tv.scale.x', 2.1)
  set('tv.scale.y', 2.1)
end)

stepEvent(1530, function()
    doTweenAlpha('overlayGone', 'overlay', 0, 0.15, linear)
    doTweenAlpha('weebSchoolGone', 'weebSchool', 0, 1.7, linear)
    doTweenAlpha('weebStreetGone', 'weebStreet', 0, 1.7, linear)
    doTweenAlpha('Particles_whiteGone', 'Particles_white', 0, 1.7, linear)
    doTweenAlpha('dadGone', 'dad', 0, 1.7, linear)
    doTweenAlpha('boyfriendGone', 'boyfriend', 0, 1.7, linear)
    doTweenX('StaticTV2 x', 'StaticTV2.scale', 3.0, 1.7,'QuadOut')
    doTweenY('StaticTV2 y', 'StaticTV2.scale', 3.0, 1.7,'QuadOut')
    doTweenX('tv x', 'tv.scale', 0.67, 1.7,'QuadOut')
    doTweenY('tv y', 'tv.scale', 0.67, 1.7,'QuadOut')
    doTweenZoom('cam1', 'camGame', 0.60, 1.7,'QuadOut')
end)

stepEvent(1552, function()
setVar('canDie', false)
setWindowScale(monitorWidth, monitorHeight)
HideTaskBar()
doBorderless()
  set('Blue.alpha', 1)
  setStrumAlpha('opponent', 0)
  set('tv.alpha', 0)
end)

stepEvent(1553, function()
  set('Coding.alpha', 1)
  set('Coding2.alpha', 1)
end)

stepEvent(1580, function()
  doTweenAlpha('StaticTV3Gone', 'StaticTV3', 0.63, 1.5, linear)
end)

stepEvent(1585, function()
  set('BlackLiquid2.alpha', 1)
  objectPlayAnimation('BlackLiquid2', 'Move', false)
end)

stepEvent(1596, function()
  set('bf1.alpha', 1)
end)

stepEvent(1597, function()
  doTweenAlpha('bf1Gone', 'bf1', 0, 0.18, linear)
end)

stepEvent(1598, function()
  set('bf2.alpha', 1)
end)

stepEvent(1599, function()
  doTweenAlpha('bf2Gone', 'bf2', 0, 0.18, linear)
end)

stepEvent(1600, function()
  set('bf3.alpha', 1)
end)

stepEvent(1601, function()
  doTweenAlpha('bf3Gone', 'bf3', 0, 0.18, linear)
end)

stepEvent(1602, function()
  set('bf4.alpha', 1)
end)

stepEvent(1603, function()
  doTweenAlpha('bf4Gone', 'bf4', 0, 0.18, linear)
end)

stepEvent(1604, function()
  set('bf5.alpha', 1)
end)

stepEvent(1605, function()
  doTweenAlpha('bf5Gone', 'bf5', 0, 0.18, linear)
end)

stepEvent(1606, function()
  set('bf6.alpha', 1)
end)

stepEvent(1607, function()
  set('Coding2.alpha', 0)
end)

stepEvent(1608, function()
  doTransWindow()

  set('StaticTV.scale.x', 0.5)
  set('StaticTV.scale.y', 0.5)
  set('StaticTV.y', 35)
  set('StaticTV.x', -390)

  set('tv2.scale.x', 0.24)
  set('tv2.scale.y', 0.24)
  set('tv2.y', 25)
  set('tv2.x', -390)

  set('black.scale.x', 0.24)
  set('black.scale.y', 0.24)
  set('black.y', 25)
  set('black.x', -390)

  set('dad.y', 10)
  set('dad.x', 590)

  setBlendMode('StaticTV', 'MULTIPLY')
  set('StaticTV.alpha', 0.50)
  set('black.alpha', 1)
  set('StaticTV2.alpha', 0)
  set('Blue.alpha', 0)
  set('bf6.alpha', 0)
  set('BlackLiquid2.alpha', 0)
  set('StaticTV3.alpha', 0)
  set('weebSky.alpha', 0)
  set('tv2.alpha', 1)
  set('dad.alpha', 1)
  set('boyfriend.alpha', 1)

  set('tv2.y', get('dad.y') + 10)
  set('tv2.x', get('dad.x') + 10)
  set('black.y', get('dad.y') + 10)
  set('black.x', get('dad.x') + 10)
  set('StaticTV.y', get('dad.y') + 10)
  set('StaticTV.x', get('dad.x') + 10)
end)

stepEvent(1609, function()
  objectPlayAnimation('Coding', 'Move', false)
end)

stepEvent(1864, function()
    doTweenAlpha('Coding', 'Coding', 0, 0.4, linear)
    doTweenAlpha('BFG', 'BFG', 1, 0.3, linear)
    doTweenAlpha('BFG2', 'BFG2', 1, 0.3, linear)
    doTweenY('BFGScaleTweenY', 'BFG', -220, 0.7, 'QuadOut')
    doTweenX('BFGScaleTweenX', 'BFG', 1875, 0.7, 'QuadOut')
    doTweenY('BFG2ScaleTweenY', 'BFG2', 420, 0.7, 'QuadOut')
    doTweenX('BFG2ScaleTweenX', 'BFG2', 370, 0.7, 'QuadOut')
end)

stepEvent(1865, function()
  set('Coding2.alpha', 1)
  objectPlayAnimation('Coding2', 'Move', false)
end)

stepEvent({1872, 1888, 1904, 1920, 1936, 1952, 1968, 1984,
2000, 2016, 2032, 2048, 2064, 2080, 2096, 2112}, function()
  cancelTween('BFGScaleTweenY')
  cancelTween('BFGScaleTweenX')
  cancelTween('BFG2ScaleTweenY')
  cancelTween('BFG2ScaleTweenX')
  set('BFG.y', 420)
  set('BFG2.y', -220)
end)

stepEvent({1880, 1896, 1912, 1928, 1944, 1960, 1976, 1992,
2008, 2024, 2040, 2056, 2072, 2088, 2104}, function()
  set('BFG.y', -220)
  set('BFG2.y', 420)
end)

stepEvent(2114, function()
set('defaultCamZoom', 1)
set('defaultCamHUDZoom', 1)
end)

stepEvent(2120, function()
removeTransWindow()
local windowWidth = 1280
local windowHeight = 720
local screenWidth = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
local screenHeight = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
local posX = math.floor((screenWidth - windowWidth) / 2)
local posY = math.floor((screenHeight - windowHeight) / 2)
setWindowScale(windowWidth, windowHeight)
setPropertyFromClass('openfl.Lib', 'application.window.x', posX)
setPropertyFromClass('openfl.Lib', 'application.window.y', posY)
removeBorderless()
RestoreTaskBar()

  setStrumAlpha('player', 0)
  setVar('canDie', true)
  set('Coding2.alpha', 0)
  set('boyfriend.alpha', 0)
  set('dad.alpha', 0)
  set('BFG.alpha', 0)
  set('BFG2.alpha', 0)
  set('tv2.alpha', 0)
  set('black.alpha', 0)
  set('staticTV.alpha', 0)
  setBlendMode('StaticTV2', 'MULTIPLY')
  set('StaticTV2.alpha', 0.50)
  set('FlashBF.alpha', 1)
  set('FlashBF.y', -220)
  set('FlashBF.x', 160)
  set('weebSky.alpha', 0.15)
  set('tv.alpha', 1)
end)

stepEvent(2121, function()
  doTweenAlpha('FlashBF', 'FlashBF', 0, 0.5, linear)
end)

stepEvent(2248, function()
  doTweenAlpha('void', 'void', 1, 9.9, linear)
end)
end
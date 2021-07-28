function setDefault(id)	_G['defaultStrum'..id..'X'] = getActorX(id)
end
function start(song)
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
    end --this centers bf strumline and removes dad strumline (copied from modchart examples)
    strumLine1Visible = False
    setCamZoom(0.7) -- camera zoom
    setActorAlpha(0, 'girlfriend') -- removes girlfriend (rip)


end

local defaultHudX = 0
local camHudAngle = 0

function update(elasped)
    --if healthLocked then
    --    setHealth(1)
    --end
    --if healthLocked_ then
    --    setHealth(0.5)
    --end
    --if curStep == 1 then
    --    setHudZoom(10)
    --    setCamZoom(10)
    --end
    --if curStep == 3 then
    --    setHudZoom(0)
    --    setCamZoom(0.7)
    --end
    --if curStep == 2 then
    --    setHealth(0.001)
    --end
    --if curStep == 256 then
    --    setCamZoom(2)
    --    setHudZoom(2)
    --end
    --if curStep == 255 then
    --    setHudZoom(0)
    --    setCamZoom(0)
    --end
    --if curStep == 128 then
    --    showOnlyStrums = true
    --    setHudZoom(10)
    --end
    --if curStep == 127 then
    --    setHudZoom(0)
    --end
    --if curStep == 129 then
    --    setHudZoom(0.7)
    --end
    --if curStep == 384 then
    --    showOnlyStrums = false
    --end
    --if curStep == 400 then
    --    showOnlyStrums = true
    --end
    --if curStep == 448 then
    --    showOnlyStrums = false
    --end
    --if curStep == 464 then
    --    showOnlyStrums = true
    --end
    --if curStep == 640 then
    --    showOnlyStrums = false
    --    setHealth(0.001)
    --end
    --if curStep == 703 then
    --    setHealth(0.001)
    --end
    --if curStep == 767 then
    --    setHealth(0.001)
    --end
    --if curStep == 772 then
    --    setHealth(0.001)
    --end
    --if curStep == 775 then
    --    setHealth(0.001)
    --end
    --if curStep == 780 then
    --    setHealth(0.001)
    --end
    --if curStep == 784 then
    --    setHealth(0.001)
    --end
    --if curStep == 799 then
    --    setHealth(0.001)
    --end
    --if curStep == 815 then
    --    setHealth(0.01)
    --end
    --if curStep == 832 then
    --    setHealth(0.5)
    --end
    --if curStep == 863 then
    --    showOnlyStrums = true
    --end
    --if curStep == 895 then
    --    setHealth(1)
    --    showOnlyStrums = false
    --end
    --if curStep == 911 then
    --    setHealth(0.5)
    --    showOnlyStrums = true
    --end
    --if curStep == 983 then
    --    setHealth(1)
    --    showOnlyStrums = false
    --end
    --if curStep == 992 then
    --    setHealth(0.5)
    --end
    --if curStep == 999 then
    --    setHealth(0.5)
    --end
    --if curStep == 1006 then
    --    setHealth(0.5)
    --end
    --if curStep == 1015 then
    --    healthLocked = true
    --    showOnlyStrums = false
    --end
    --if curStep == 832 then
    --    setHealth(0.5)
    --end
    --if curStep == 1023 then
    --    healthLocked = false
    --    showOnlyStrums = true
    --end
    --if curStep == 1041 then
    --    healthLocked = true
    --    showOnlyStrums = false
    --end
    --if curStep == 1088 then
    --   healthLocked = false
    --showOnlyStrums = true
   --end
   --if curStep == 1152 then
   --   showOnlyStrums = false
   --     healthLocked_ = true
    --end
    --if curStep == 1279 then
    --    showOnlyStrums = false
    --    healthLocked_ = false
    --end
    --if curStep == 1300 then
    --    showOnlyStrums = true
    --    healthLocked_ = false
    --end
    --if curStep == 1363 then
    --    setHealth(1)
    --end
    --if curStep == 1376 then
    --   setHealth(1)
    --end
    --if curStep == 1383 then
    --    setHealth(1)
    --end
    --if curStep == 1390 then
    --    setHealth(1)
    --end
    --if curStep == 1400 then
    --    setHealth(2)
    --end
    --if curStep == 1403 then
    --    setHealth(0.5)
    --end
    --if curStep == 1405 then
    --    setHealth(1.4)
    --end
    --if curStep == 1417 then
    --    showOnlyStrums = true
    --end
    -- my fingers hurt
        local currentBeat = (songPos / 1000)*(bpm/60)
        for i=0,7 do
        setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
    end
end

function keyPressed(key)
end

function stepHit (step) -- arrow spin copied from agoti
    if curStep == 355 or curStep == 457 or curStep == 595 or curStep == 836 or curStep == 954 or curStep == 1064 or curStep == 1556 or curStep == 1889 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end
end
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
        local currentBeat = (songPos / 1000)*(bpm/60)
        for i=0,7 do
        setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
    end
end


function keyPressed(key)
end

function stepHit (step)
    if curStep == 355 or curStep == 457 or curStep == 595 or curStep == 836 or curStep == 954 or curStep == 1064 or curStep == 1556 or curStep == 1889 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end
end
--made by Alexis :)
-----------------
--start variables
-----------------

--troop-slot assignments
-------------------------
local barbSlot = nil;
local archSlot = nil;
local giantSlot = nil;
local gobSlot = nil;
local wbsSlot = nil;
local loonSlot = nil;
local wizSlot = nil;
local healerSlot = nil;
local dragSlot = nil;
local pekkaSlot = nil;

local minionSlot = nil;
local hogSlot = nil;
local valkSlot = nil;
local golemSlot = nil;
local witchSlot = nil;
local lavaSlot = nil;

local ccSlot = nil;

local kingSlot = nil;
local queenSlot = nil;

local lightSlot = nil;
local healSlot = nil;
local rageSlot = nil;
local jumpSlot = nil;
local freezeSlot = nil;

local poisonSlot = nil;
local earthSlot = nil;
local hasteSlot = nil;
---------------------------


--device rotation on recording
-- "3" if home button was on right
-- "4" if home button was on left
-----------------------------------
local recRotation = 3;

--minimal sleep
--1000 or more recommended
local minSleep = 1000;

--sleep after troopbar swipe
--1000000 should be good
local troopbarSleep = 1000000;

--current troopbar set
----------------------
local troopbarSet = "+";





--DONT CHANGE ANYTHING BELOW HERE UNTIL YOU SEE:
--"START YOUR SCRIPT HERE:"
-----------------------------------------

--current device rotation
-------------------------
local rotation = getOrientation();

--gets screen sizes of device
local width, height = getScreenResolution();

--x coordinate for slots left rot
----------------------------------
local xCoo = width*0.0195;
local slot1 = height*0.0583;
local slot2 = height*0.1417;
local slot3 = height*0.2251;
local slot4 = height*0.3083;
local slot5 = height*0.3916;
local slot6 = height*0.4751;
local slot7 = height*0.5583;
local slot8 = height*0.6417;
local slot9 = height*0.7251;
local slot10 = height*0.8083;
local slot11 = height*0.8917;
local slot12 = height*0.9759;
-----------------
--end variables
-----------------
------------------
--start functions
------------------

--sets slot and xCoo correct
function properCoos()
	if recRotation == 4 then
		xCoo = width-xCoo;
		slot1 = height-slot1;
		slot2 = height-slot2;
		slot3 = height-slot3;
		slot4 = height-slot4;
		slot5 = height-slot5;
		slot6 = height-slot6;
		slot7 = height-slot7;
		slot8 = height-slot8;
		slot9 = height-slot9;
		slot10 = height-slot10;
		slot11 = height-slot11;
		slot12 = height-slot12;
	end
end


--selects a slot
------------------
function selectSlot(slot)
	checkTroopbar(slot);
	
	if slot == 1 or slot == -1 then
		tapp(xCoo, slot1);
	end
	if slot == 2 or slot == -2 then
		tapp(xCoo, slot2);
	end
	if slot == 3 or slot == -3 then
		tapp(xCoo, slot3);
	end
	if slot == 4 or slot == -4 then
		tapp(xCoo, slot4);
	end
	if slot == 5 or slot == -5 then
		tapp(xCoo, slot5);
	end
	if slot == 6 or slot == -6 then
		tapp(xCoo, slot6);
	end
	if slot == 7 or slot == -7 then
		tapp(xCoo, slot7);
	end
	if slot == 8 or slot == -8 then
		tapp(xCoo, slot8);
	end
	if slot == 9 or slot == -9 then
		tapp(xCoo, slot9);
	end
	if slot == 10 or slot == -10 then
		tapp(xCoo, slot10);
	end
	if slot == 11 or slot == -11 then
		tapp(xCoo, slot11);
	end
	if slot == 12 or slot == -12 then
		tapp(xCoo, slot12);
	end
end

--selects the troop, slot needs to be 
--specified in varaible before
--------------------------------------
function select(thing)
	--elixir troops
	if thing == "arch" then
		selectSlot(archSlot);
	end
	if thing == "barb" then
		selectSlot(barbSlot);
	end
	if thing == "giant" then
		selectSlot(giantSlot);
	end
	if thing == "gob" then
		selectSlot(gobSlot);
	end
	if thing == "wbs" then
		selectSlot(wbsSlot);
	end
	if thing == "loon" then
		selectSlot(loonSlot);
	end
	if thing == "wiz" then
		selectSlot(wizSlot);
	end
	if thing == "healer" then
		selectSlot(healerSlot);
	end
	if thing == "drag" then
		selectSlot(dragSlot);
	end
	if thing == "pekka" then
		selectSlot(pekkaSlot);
	end
	
	--dark elixir troops
	if thing == "minion" then
		selectSlot(minionSlot);
	end
	if thing == "hog" then
		selectSlot(hogSlot);
	end
	if thing == "valk" then
		selectSlot(valkSlot);
	end
	if thing == "golem" then
		selectSlot(golemSlot);
	end
	if thing == "witch" then
		selectSlot(witchSlot);
	end
	if thing == "lava" then
		selectSlot(lavaSlot);
	end
	
	--CC, king and queen
	if thing == "king" then
		selectSlot(kingSlot);
	end
	if thing == "queen" then
		selectSlot(queenSlot);
	end
	if thing == "cc" then
		selectSlot(ccSlot);
	end
	
	--elixir spells
	if thing == "light" then
		selectSlot(lightSlot);
	end
	if thing == "heal" then
		selectSlot(healSlot);
	end
	if thing == "rage" then
		selectSlot(rageSlot);
	end
	if thing == "jump" then
		selectSlot(jumpSlot);
	end
	if thing == "freeze" then
		selectSlot(freezeSlot);
	end
	
	--dark elixir spells
	if thing == "poison" then
		selectSlot(poisonSlot);
	end
	if thing == "earth" then
		selectSlot(earthSlot);
	end
	if thing == "haste" then
		selectSlot(hasteSlot);
	end
end

--checks the troopbar state and
--changes it
-----------------------------
function checkTroopbar(slot)
	if troopbarSet == "+" and slot < 0 then
		setTroopbar("-");
	end
	if troopbarSet == "-" and slot > 0 then
		setTroopbar("+");
	end
end

--sets the troopsbar to positive or negative
---------------------------------------------
function setTroopbar(set)
	if set == "+" then
		touchDown(1, recalcX(xCoo), recalcY(slot1));
		usleep(minSleep);
		touchMove(1, recalcX(xCoo), recalcY(slot12));
		usleep(minSleep);
		touchUp(1, recalcX(xCoo), recalcY(slot12));
		troopbarSet = "+";
	end
	if set == "-" then
		touchDown(1, recalcX(xCoo), recalcY(slot12));
		usleep(minSleep);
		touchMove(1, recalcX(xCoo), recalcY(slot1));
		usleep(minSleep);
		touchUp(1, recalcX(xCoo), recalcY(slot1));
		troopbarSet = "-";
	end
	usleep(troopbarSleep-minSleep*2);
end


--recalcY(if iPad turned around)
--------------------
function recalcY(y)
	if recRotation ~= rotation then
		newY = height-y;
		return (newY);
	else
		return (y);
	end
end

--recalcX(if iPad turned around)
--------------------
function recalcX(x)
	if recRotation ~= rotation then
		newX = width-x;
		return (newX);
	else
		return (x);
	end
end

--taps on a given point
----------------------------------------------
function tapp(x, y)
	tap(recalcX(x), recalcY(y));
	usleep(minSleep);
end

--taps on a given point n amount of times
-------------------------------------------
function multiTapp(x, y, n)
	for i=1,n do 
		tapp(x, y)
	end
end

--SHOULD! select slot 1-12,
--swipe over to negative slots
--select -1 - -12
--swipes back
--select 1-3 again
-----------------------------
function demo()
	local slotNmbr =1
	while slotNmbr <= 12 do
		selectSlot(slotNmbr);
		slotNmbr = slotNmbr+1
		usleep(1000000);
	end
	
	slotNmbr = -1
	while slotNmbr >= -12 do
		selectSlot(slotNmbr);
		slotNmbr = slotNmbr-1
		usleep(1000000);
	end
	
	local slotNmbr =1
	while slotNmbr <= 3 do
		selectSlot(slotNmbr);
		slotNmbr = slotNmbr+1
		usleep(1000000);
	end
end

properCoos();
----------------
--end functions
----------------

--START YOUR SCRIPT HERE:
demo();
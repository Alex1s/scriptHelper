--made by Alexis :)
--version 7.6


-----------------
--start variables
-----------------

--troop-slot assignments
-------------------------
--Change the "0" to the Slot number of the troop
--if the troop isnt used, please put its value to "0"
local troops = {
	--elixir troops:
	barb = 0 ,
	arch = 0 ,
	giant = 0 ,
	gob = 0 ,
	wbs = 0 ,
	loon = 0 ,
	wiz = 0 ,
	healer = 0 ,
	drag = 0 ,
	pekka = 0 ,

	--dark elixir troops:
	minion = 0 ,
	hog = 0 ,
	valk = 0 ,
	gol = 0 ,
	witch = 0 ,
	lava = 0 ,

	--clan castle and heroes:
	cc = 0 ,
	king = 0 ,
	queen = 0 ,
	warden = 0 ,

	--elixir spells:
	light = 0 ,
	heal = 0 ,
	rage = 0 ,
	jump = 0 ,
	freeze = 0 ,

	--dark elixir spells:
	poison = 0 ,
	earth = 0 ,
	haste = 0 ,

	--dark elixir cc spell
	ccSpell = 0
}
---------------------------

--type of screen when script was recorded (to convert coordinates)
--only important if u want to run on another device
--unimportant if you only use script on your own device
--enter "noretina" or "retina"
------------------------------------------------------
local recScreenRes = "retina"

--device rotation on recording
-- "3" if home button was on right
-- "4" if home button was on left
-----------------------------------
local recRotation = 3

--minimal sleep
--1000 or more recommended
local minSleep = 1000

--sleep after troopbar swipe
--1000000 should be good
local troopbarSleep = 1000000

--troopbar set at beginning of script
----------------------
local troopbarSet = "+"





--DONT CHANGE ANYTHING BELOW HERE UNTIL YOU SEE:
--"START YOUR SCRIPT HERE:"
-----------------------------------------

--set the recording resolution
----------------------------------------
function setRecResolution()
	if recScreenRes == "retina" then
		recWidth = 1536
		recHeight = 2048
	elseif recScreenRes == "noretina" then
		recWidth = 768
		recHeight = 1024
	end
end
setRecResolution()


--the total troop count
local totalTroopCount = 0

--noAccesSlots
--will be defined in setTotalTroopCount()
---------------------------------
local noAccesSlots

--current device rotation
-------------------------
local rotation = getOrientation()

--gets screen sizes of device
local width, height = getScreenResolution()

--x coordinate for slots left rot
----------------------------------
local slotCoo = {
	recHeight*0.0583 , --slot 1
	recHeight*0.1417 , --slot 2
	recHeight*0.2251 , --slot 3
	recHeight*0.3083 , --slot 4
	recHeight*0.3916 , --slot 5
	recHeight*0.4751 , --slot 6
	recHeight*0.5583 , --slot 7
	recHeight*0.6417 , --slot 8
	recHeight*0.7251 , --slot 9
	recHeight*0.8083 , --slot 10
	recHeight*0.8917 , --slot 11
	recHeight*0.9759 --slot 12
}
slotCoo["x"] = recWidth*0.0195
-----------------
--end variables
-----------------
------------------
--start functions
------------------
--[[
function setVars( )
	-- body
end
--]]
function setTotalTroopCount()
	--set totalTroopCount
	for i, v in pairs(troops) do
		if v ~= 0 then
			totalTroopCount = totalTroopCount+1
		end
		noAccesSlots = totalTroopCount-12
	end

	--print error
	if totalTroopCount < 12 or totalTroopCount > 24 then
		alert("ERROR!\
You entered too few or too many troops. See log for details.")
		log("You entered too few or too many troops. ScriptHelper only supports 12-24 slots used.")
	end
end


function wrongSlotValueCheck()
	for i, v in pairs(troops) do
		if v < 0 or v > 24 then
			alert("ERROR! Something went wrong with the assigned slots. Please see the log for details.")
			log(string.format("The assigned slot %q for the troop %q is incorrect.", v, i ));
		end
	end
end

--sets slot and xCoo correct
function properCoos()
	if recRotation == 4 then
		slotCoo["x"] = width - slotCoo["x"]
		for i=1, 12 do
			slotCoo[i] = height - slotCoo[i]
		end
	end
end


--selects a slot
------------------
function selectSlot(slot, troopName)
	if slot ~= 0 then
		if troopbarSet == "-" then
			if slot-noAccesSlots > 0 then
				slot = slot-noAccesSlots
				--usleep(troopbarSleep)
			else
				setTroopbar("+")
			end
		--this happens of troopbar set ~= "-" -> troopBarSet = "+"
		elseif slot > 12 then
			setTroopbar("-")
			slot = slot-noAccesSlots
		end
		tapp(slotCoo["x"], slotCoo[slot])

	else
		--print error
		alert(string.format("ERROR!\
You did not enter a slot for the troop %q. See the log for details.", troop))
		log(string.format("ERROR!\
You did not enter a slot for the troop %q.", troop))
	end
end

--selects the troop, slot needs to be 
--specified in varaible before
--------------------------------------
function select(troop)
	if troops[troop] == nil then
		alert(string.format("ERROR!\
There is no troop named %q. See the log for details", troop))
		log(string.format("ERROR! There is no troop named %q. See the readme for more details on the naming of troops.", troop))
	else
		selectSlot(troops[troop], troop)
	end
end


--sets the troopsbar to positive or negative
---------------------------------------------
function setTroopbar(set)
	if set == "+" then
		touchDown(1, recalcX(slotCoo["x"]), recalcY(slotCoo[1]))
		usleep(troopbarSleep/2)
		for i=1, 12, 1 do 
			usleep(minSleep);
			touchMove(1, recalcX(slotCoo["x"]), recalcY(slotCoo[i]))
		end
		usleep(minSleep)
		touchUp(1, recalcX(slotCoo["x"]), recalcY(slotCoo[12]))
		troopbarSet = "+";
		--sleep troop-min*13
	end
	if set == "-" then
		touchDown(1, recalcX(slotCoo["x"]), recalcY(slotCoo[12]))
		usleep(troopbarSleep/2)
		for i=12, 1, -1 do 
			usleep(minSleep);
			touchMove(1, recalcX(slotCoo["x"]), recalcY(slotCoo[i]))
		end
		usleep(minSleep)
		touchUp(1, recalcX(slotCoo["x"]), recalcY(slotCoo[1]))
		troopbarSet = "-";
	end
	usleep(troopbarSleep - (minSleep*13 - troopbarSleep/2) )
end


--recalcY(if iPad turned around)
--------------------
function recalcY(y)
	if recRotation ~= rotation then
		y = recHeight-y --height
	end
	y = convRes(y)
	return y
end


--recalcX(if iPad turned around)
--------------------
function recalcX(x)
	if recRotation ~= rotation then
		x = recWidth-x --(width)
	end
	x = convRes(x)
	return x

end

--convert resolution
function convRes(coo)
	if recScreenRes == "noretina" and width == 1536 then
		coo = coo*2
	elseif recScreenRes == "retina" and width == 768 then
		coo = coo/2	
	end
	return coo
end

--taps on a given point
----------------------------------------------
function tapp(x, y)
	tap(recalcX(x), recalcY(y))
	usleep(minSleep);
end

--taps on a given point n amount of times
-------------------------------------------
function multiTapp(x, y, n)
	if res == "retina" and recScreenRes == "noretina" then
		x = x / 2
		y = y / 2
	elseif res == "noretina" and recScreenRes == "retina" then
		x = x * 2
		y = y * 2
	end
	
	for i=1,n do 
		tapp(x, y)
	end
end

--activates the ability of the given hero
--selects the hero if he wasnt deployed first
--------------------------------------------------
function ability(hero)
	select(hero)
end

properCoos()
setTotalTroopCount()
wrongSlotValueCheck()
----------------
--end functions
----------------

--START YOUR SCRIPT HERE:
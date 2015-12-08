##Functions:

tapp(x, y);taps on a given point, no need of any usleep

multiTapp(x, y, n) taps n amount of times on a given point, no need of any usleep

select("troopName") selects troopName, slot needs to be defined in var to work, no need of any usleep

selectSlot(slotNumber) selects the given slot, useless if you use the *select("troopName") function...


##Varibiables:
minSleep = this is the minimum amount of time used on any screen tap (because *AutoTouch messed uo otherwise), defsult should be ok

troopbarSleep = time to wait after troopbar swipe, to prevent the script to mess up, default is 1s, take that into consideration for your timings

troopbarSet = if you start script with the troopbar to the right change this to "-", but usualy you dont need to touch this

recRotation = the device rotation when the script was recorded; if home button was on right -> 3, if home button was on left -> 4

convertTo = change the value of this variable to "retina" if you want to run a non-retina script on your retina device

            change the value of this variable to "noretina" if you want to run a retina script on your non-retina device



##troop-slot-assignments:


define what troop is in what slot, slots are counted from left to right starting at "1", min 12 troops, max 24 troops

DO NOT FORGET TO PUT THE TOTAL AMOUNT OF TROOPS IN THE "totalTroopCount" var
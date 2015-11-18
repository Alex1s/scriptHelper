##Functions:
demo(); put more than 12 troops and sim and run this function to see if this tool here actually works ^^

tapp(x, y);taps on a given point, no need of any usleep

multiTapp(x, y, n) taps n amount of times on a given point, no need of any usleep

select("troopName") selects troopName, slot needs to be defined in var to work, no need of any usleep

selectSlot(slotNumber) selects the given slot, useless if you use the *select("troopName") function, negative slot number = slot number when troopbar swiped to the right


##Varibiables:
minSleep = this is the minimum amount of time used on any screen tap (because *AutoTouch messed uo otherwise), defsult should be ok

troopbarSleep = time to wait after troopbar swipe, to prevent the script to mess up, default is 1s, take that into consideration for your timings

troopbarSet = if you start script with the troopbar to the right change this to "-", but usualy you dont need to touch this

recRotation = the device rotation when the script was recorded; if home button was on right -> 3, if home button was on left -> 4

##troop-slot-assignments:


define what troop is in what slot, slots are counted from left to right starting at "1", if the troop is out of reach (you have to swipe) do negative values

eg. haste= -12 meaning that if the troopbar is swiped towards the very right the haste spell is in the 12th slot

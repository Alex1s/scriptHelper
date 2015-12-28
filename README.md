##Functions:

tapp(x, y) - taps on a given point, no need of any usleep

multiTapp(x, y, n) - taps n amount of times on a given point, no need of any usleep

select("troopName") selects troopName, slot needs to be defined in var to work, no need of any usleep

selectSlot(slotNumber) selects the given slot, useless if you use the *select("troopName") function


##Varibiables:
minSleep = this is the minimum amount of time used on any screen tap (because *AutoTouch messed uo otherwise), defsult should be ok

troopbarSleep = time to wait after troopbar swipe, to prevent the script to mess up, default is 1s, take that into consideration for your timings

troopbarSet = if you start script with the troopbar to the right change this to "-", but usualy you dont need to touch this

recRotation = the device rotation when the script was recorded; if home button was on right -> 3, if home button was on left -> 4

recScreenRes = enter "retia" or "noretina", this var is important if u want to run a nonretina script on a retina device; if you use your script only locally this var can be ignored



##troop-slot-assignments:


define what troop is in what slot, slots are counted from left to right starting at 1

you need to use at least 12 troops and are allowed to use a maximum of 24 troops.

Make sure you enter ALL the troops that are used in the attack, or script will calulate total amount of troops wrong.

##Troop Names
the text inside the select command (select("text")) needs to be exact, in the list below you will be able to see what text you will have to enter to get the troop you want

| real Name  | script name |
| ------------- | ------------- |
| Barbarian | barb |
| Archer | arch |
| Giant | giant |
| Goblin | gob |
| Wallbreaker | wbs |
| Balloon | loon |
| Wizard | wiz |
| Healer | healer |
| Dragon | drag |
| P.E.K.K.A. | pekka |
| Minion | minion |
| Hog Rider | hog |
| Valkyrie | valk |
| Golem | gol |
| Witch | witch |
| Lavahound | lava |
| Clan Castle | cc |
| Barbarian King | king |
| Archer Queen | queen |
| Lightning Spell | light |
| Heal Spell | heal |
| Rage Spell | rage |
| Jump Spell | jump |
| Freeze Spell | freeze |
| Poison spell | poison |
| Earthquake Spell | earth |
| Haste Spell | haste |

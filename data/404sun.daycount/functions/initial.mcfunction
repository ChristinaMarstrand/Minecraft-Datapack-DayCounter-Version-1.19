#Message Show
tellraw @a [{"text":"[DayCount]: ","color":"white"},{"text":"Sunflower's DayCount is now active and can be modified using the following command!","color":"white"},{"text":"/trigger DayCount_Style","color":"yellow"}]

#Initialize Day Count
scoreboard players set #404sun_daycount 404sun_daycount 0
scoreboard players set #404sun_stored 404sun_daycount 0
scoreboard players set @a[tag=!404sun_style] DayCount_Style 0
execute if score #404sun_style DayCount_Style matches 1 run scoreboard players set @a[tag=!404sun_style] DayCount_Style 1
execute if score #404sun_style DayCount_Style matches 2 run scoreboard players set @a[tag=!404sun_style] DayCount_Style 3
execute if score #404sun_style DayCount_Style matches 3 run scoreboard players set @a[tag=!404sun_style] DayCount_Style 5

#Tags On All Players
tag @a remove 404sun.shown
tag @a add 404sun.style

#Loop Until Player Peak At least 1
execute unless entity @a run schedule function 404sun.daycount:initial 1t
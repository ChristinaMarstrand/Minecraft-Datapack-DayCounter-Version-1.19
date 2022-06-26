#Updates Gametime Statistics
execute store result score #404sun_daycount 404sun.daycount run time query day
scoreboard players add #404sun_daycount 404sun.daycount 1
execute unless score #404sun_daycount 404sun.daycount = #404sun_stored 404sun.daycount run tag @a remove 404sun.shown
execute unless score #404sun_daycount 404sun.daycount = #404sun_stored 404sun.daycount run execute store result score #404sun_stored 404sun.daycount run scoreboard players get #404sun_daycount 404sun.daycount

#Displays DayCount in Chat
execute if score #404sun_style DayCount_Style matches 1 run tellraw @a[tag=!404sun.shown] [{"text":"Day ","color":"white","bold":true},{"score":{"name":"#404sun_daycount","objective":"404sun.daycount"},"color":"gold","bold":true}]

#Displays DayCount above inventory hot-bar
execute if score #404sun_style DayCount_Style matches 2 run title @a[tag=!404sun.shown] times 10 60 20
execute if score #404sun_style DayCount_Style matches 2 run title @a[tag=!404sun.shown] actionbar [{"text":"Day ","color":"white","bold":true},{"score":{"name":"#404sun_daycount","objective":"404sun.daycount"},"color":"gold","bold":true}]

#Displays DayCount on Screen
execute if score #404sun_style DayCount_Style matches 3 run title @a[tag=!404sun.shown] times 10 60 20
execute if score #404sun_style DayCount_Style matches 3 run title @a[tag=!404sun.shown] title [{"text":"Day ","color":"white","bold":true},{"score":{"name":"#404sun_daycount","objective":"404sun.daycount"},"color":"gold","bold":true}]

#Sets up Scoreboard
execute if score #404sun_style DayCount_Style matches 1 run scoreboard players set @a[tag=!404sun_style] DayCount_Style 1
execute if score #404sun_style DayCount_Style matches 2 run scoreboard players set @a[tag=!404sun_style] DayCount_Style 3

#Tags Players
tag @a[tag=!404sun.shown] add 404sun.shown
tag @a[tag=!404sun_style] add 404sun.style

#Loop
schedule function 404sun.daycount:timer_1s 20t
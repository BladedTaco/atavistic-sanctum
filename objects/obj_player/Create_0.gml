/// @description initialise player

player_number = 0 //number of the player (maps to obj_input.input_array's first dimension
character = BAL //character as a macro
colour_pallet = "" //colour pallet as a string
percentage = 0 //damage
max_jumps = 1 //maximum amount of aerial jumps
weight = 1 //weight multiplier (initial knockback resistance)
inertia = 1 //inertia multiplier (sliding resistance)
jab = 1 //current jab number
bracing = 1 //resistance to knockback based on state
momentum_x = 0 //momentum horizontally
momentum_y = 0 //momentum vertically
last_x = x //used for eth trail effect
last_y = y //used for eth trail effect
last_x2 = x //used for eth trail effect
last_y2 = y //used for eth trail effect
alarm[0] = -1 //ledge alarm
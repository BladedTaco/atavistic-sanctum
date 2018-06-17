/// @description initialise player

player_number = 0 //number of the player (maps to obj_input.input_array's first dimension
character = BAL //character as a macro
colour_pallet = "" //colour pallet as a string
percentage = 0 //damage
max_jumps = 3 //maximum amount of aerial jumps
weight = 1 //weight multiplier (initial knockback resistance)
inertia = 1 //inertia multiplier (sliding resistance)
jab = 1 //current jab number
bracing = 1 //resistance to knockback based on state
momentum_x = 0 //momentum horizontally
momentum_y = 0 //momentum vertically
mom_x = 0 //momentum horiztontally used for momentum lag
mom_y = 0 //momentum vertically used for momentum lag
inertial = true //false for when momentum should not be used to move character
last_x = x //used for eth trail effect
last_y = y //used for eth trail effect
last_x2 = x //used for eth trail effect
last_y2 = y //used for eth trail effect
spawning = true //if just spawned in
effective_x = x //the effective x offset used for moves that move the character without changing position
effective_y = y //the effective y offset used for moves that move the character without changing position
alarm[0] = -1 //ledge alarm

sprite[0, 0] = sprite_index
sprite[0, 1] = image_index
sprite[0, 2] = image_xscale
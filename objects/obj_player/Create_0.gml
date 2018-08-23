/// @description initialise player

player_number = 0 //number of the player (maps to obj_input.input_array's first dimension
character = BAL //character as a macro
colour_pallet = "" //colour pallet as a string
pal_surface = -1 //pallet surface
img_blend = c_white //image blend colour, based on team
player_col = c_white //colour based on the player slot
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
effective_x = 0 //the effective x offset used for moves that move the character without changing position
effective_y = 0 //the effective y offset used for moves that move the character without changing position
smash_charge = -1; //how charged a smash attack is
last_damage = 0 //the amount of damage taken from the last attack
new_momentum_x = 0 //the momentum to apply after a momentum stall
new_momentum_y = 0 //the momentum to apply after a momentum stall 
helpless_sprite = -1 //the sprite to use when in the helpless state
attacker = noone //the most recent attacker
recovered = false //if a recovery move has been used mid air
wiggle = false //used to determine if a grabbed player should move slightly to show breaking free
smash_frame = -1 //the frame to freeze on for a smash attack
hitbox_override = false //override used to create hitboxes when not animation
draw_count = 0 //an incrementing number used to animate through coded animations
hitstun = 1 //hitstun mulitplier
sub_recovery = 0 //used for moves like geo's down special to only allow a certain number of repeats
shield_max_percentage = 30 //max health for shield
shield_percentage = shield_max_percentage //current shield health
stocks = 3 //number of stocks for the player
dead = false //whether or not the player is dead
child_object = noone //used to hold child objects ids that have to be referenced
name = "NO NAME"
placing = -1 //position in game
alarm[0] = -1 //ledge alarm
alarm[1] = -1 //platform alarm
alarm[2] = -1 //smash attack alarm
alarm[3] = -1 //c stick alarm
alarm[4] = -1 //hitbox sleeping alarm


show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number))
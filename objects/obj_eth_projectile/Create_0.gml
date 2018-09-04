/// @description init variables
image_angle = global.eth_angle

creator = global.bbox[10]
//most of these variables are to avoid crashes when this object is treated as a hitboxes creator
type = 0
last_dir = 90
target = noone
hitbox_override = true
_dir = 0
hitstun = 1
character = ETH
alarm[0] = GAME_SPEED*2 //can live for 2 seconds
depth = -15 //set depth to be in front of players
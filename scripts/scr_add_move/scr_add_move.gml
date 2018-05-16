///@func scr_add_move(sprite_index, image_index, hitbox_index, shape, major_axis, minor_axis, x, y, rotation, damage, direction, base knockback, scaling knockback)
///@param sprite_index - the sprite_index for the associated data
///@param image_index - the image_index for the associated data
///@param hitbox_index - the number of the hitbox of the move (moves can have up to 10 hitboxes)
///@param shape - the shape of the hitbox
///@param major_axis - the major axis of the hitbox
///@param minor_axis - the minor axis of the hitbox
///@param x - the x position of the centre of the hitbox relative to sprite origin
///@param y - the y position of the centre of the hitbox relative to sprite origin
///@param rotation - the rotation of the hitbox (default is major axis is x, minor is y)
///@param damage - the damage of the move
///@param direction - the direction of the knockback of the move
///@param base_knockback - the base knockback of the move
///@param scaling_knockback - the scaling knockback of the move
///@desc creates a move and its hitboxes with the given information based on a sprite index and image index

if (argument[3] = NULL) { exit } //if there is no hitbox, exit script

var i = argument[0]							//first element of array
var o = argument[1]*100	+ argument[2]*10	//second element of array (mostly)

global.hitbox[i, o + 0] = argument[3]		//shape
global.hitbox[i, o + 1] = argument[4]		//major axis
global.hitbox[i, o + 2] = argument[5]		//minor axis
global.hitbox[i, o + 3] = argument[6]		//x
global.hitbox[i, o + 4] = argument[7]		//y
global.hitbox[i, o + 5] = argument[8]		//rotation
global.hitbox[i, o + 6] = argument[9]		//damage
global.hitbox[i, o + 7] = argument[10]		//direction
global.hitbox[i, o + 8] = argument[11]		//base knocback
global.hitbox[i, o + 9] = argument[12]		//scaling knockback
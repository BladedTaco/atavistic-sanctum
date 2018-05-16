///@func scr_add_hurtbox(sprite_index, image_index, hurtbox_index, shape, major_axis, minor_axis, x, y, rotation, damage, direction, base knockback, scaling knockback)
///@param sprite_index - the sprite_index for the associated data
///@param image_index - the image_index for the associated data
///@param hurtbox_index - the number of the hurtbox of the move (characters can have up to 10 hurtboxes)
///@param shape - the shape of the hitbox
///@param major_axis - the major axis of the hurtbox
///@param minor_axis - the minor axis of the hurtbox
///@param x - the x position of the centre of the hurtbox relative to sprite origin
///@param y - the y position of the centre of the hurtbox relative to sprite origin
///@param rotation - the rotation of the hurtbox (default is major axis is x, minor is y)
///@desc creates the hurtboxes for a move with the given information based on a sprite index and image index

if (argument[3] = NULL) { exit } //if there is no hurtbox, exit script

var i = argument[0]							//first element of array
var o = argument[1]*100	+ argument[2]*10	//second element of array (mostly)

global.hitbox[i, o + 0] = argument[3]		//shape
global.hitbox[i, o + 1] = argument[4]		//major axis
global.hitbox[i, o + 2] = argument[5]		//minor axis
global.hitbox[i, o + 3] = argument[6]		//x
global.hitbox[i, o + 4] = argument[7]		//y
global.hitbox[i, o + 5] = argument[8]		//rotation
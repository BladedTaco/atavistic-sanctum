///@func scr_add_move(sprite, image, hitbox, shape, width, height, x, y, rotation, damage, direction, base, scaling, hitstun*)
///@param sprite - the sprite_index for the associated data
///@param image - the image_index for the associated data
///@param hitbox - the number of the hitbox of the move (moves can have up to 10 hitboxes)
///@param shape - the shape of the hitbox
///@param width - the width of the hitbox / major axis
///@param height - the height of the hitbox / minor axis
///@param x - the x position of the centre of the hitbox relative to sprite origin
///@param y - the y position of the centre of the hitbox relative to sprite origin
///@param rotation - the rotation of the hitbox (default is major axis is x, minor is y)
///@param damage - the damage of the move
///@param direction - the direction of the knockback of the move (-1 for grab)
///@param base - the base knockback of the move
///@param scaling - the scaling knockback of the move
///@param hitstun - the hitstun multiplier for the move
///@desc creates a move and its hitboxes with the given information based on a sprite index and image index


var i = argument[0]							//first element of array
var o = argument[1]*100	+ argument[2]*11	//second element of array (mostly)

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
if (argument_count > 13) {
	global.hitbox[i, o + 10] = argument[13]	//hitstun multiplier
} else {
	global.hitbox[i, o + 10] = 1			//hitstun multiplier
}
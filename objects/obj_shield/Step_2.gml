/// @description create shield hitbox

if (instance_exists(creator)) { //if there is a player to shield
	global.bbox[10] = id //set hitbox creator to self
	scr_check_collision(CIRCLE, 25, 25, x, y, 0) //create hitbox	
}
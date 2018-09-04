/// @description 
if !(free) { //if the ledge is occupied
	if (instance_exists(hitbox)) { //destroy the hitbox
		instance_destroy(hitbox)	
		hitbox = noone
	}
	var _inst = instance_nearest(x, y, obj_player)
	if (point_distance(x, y, _inst.x, _inst.y) > 3) { //if there is no player on the ledge
		//free the ledge and create the hitbox
		free = true
		hitbox = scr_check_collision_test(RECTANGLE, 20, 20, x - 20*facing - 1, y + 19, 0)
	}
}
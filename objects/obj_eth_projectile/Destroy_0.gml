/// @description 
if (alarm[0] > 3) {
	global.eth_angle = 0
	global.bbox[10] = creator
	with (instance_create(x, y, obj_eth_projectile)) {
		alarm[0] = 3	
		image_index = 7
		creator = other.creator
	}
} else {
	if (instance_exists(creator)) {
		if (creator.object_index = obj_player) {
			creator.sub_recovery --	
		}
	}
}
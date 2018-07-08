/// @description 
if (alarm[0] > 3) {
	global.eth_angle = 0
	with (instance_create(x, y, obj_eth_projectile)) {
		alarm[0] = 3	
		image_index = 7
	}
} else {
	if (instance_exists(creator)) {
		creator.sub_recovery --	
	}
}
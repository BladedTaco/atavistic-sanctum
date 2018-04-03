/// @description 
if (sprite_index = sprite_speed_up) {
	sprite_index = sprite_walk	
}

if (sprite_index = sprite_dash) {
	sprite_index = sprite_run	
}

if (sprite_index = sprite_jump or sprite_index = sprite_air_jump) {
	sprite_index = sprite_air_move	
}


if (keyboard_check(vk_left) + keyboard_check(vk_right) = 0) {
	if (grounded) {
		sprite_index = sprite_idle	
	}
}
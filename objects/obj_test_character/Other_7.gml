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


if (keyboard_check(vk_left) + keyboard_check(vk_right) + keyboard_check(ord("S")) = 0) {
	if (grounded) {
		sprite_index = sprite_idle	
	}
}

if (sprite_index = sprite_shield) {
	sprite_index = sprite_hold_shield	
	image_index = 0
}

if ((sprite_index = sprite_roll)) {
	sprite_index = sprite_idle	
}

if (sprite_index = sprite_dodge) {
	sprite_index = sprite_hold_shield	
}


if (sprite_index = sprite_aerial_forward) { sprite_index = sprite_air_move }
if (sprite_index = sprite_aerial_back) { sprite_index = sprite_air_move }
if (sprite_index = sprite_aerial_down) { sprite_index = sprite_air_move }
if (sprite_index = sprite_aerial_up) { sprite_index = sprite_air_move }
if (sprite_index = sprite_aerial_neutral) { sprite_index = sprite_air_move }

if (grounded) {
	
} else {
	
if (sprite_index = sprite_special_forward) { sprite_index = sprite_air_move }
if (sprite_index = sprite_special_down) { sprite_index = sprite_air_move }
if (sprite_index = sprite_special_up) { sprite_index = sprite_air_move }
if (sprite_index = sprite_special_neutral) { sprite_index = sprite_air_move }

}
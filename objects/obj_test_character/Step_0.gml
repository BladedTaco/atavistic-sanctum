/// @description 

if (y != 575) {
	y = min(round(y + (image_yscale*1.5)), 575)
	grounded = false
} else {
	grounded = true
}

if ((keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)) and grounded) {
	if (alarm[1] <= 0) {
		alarm[1] = room_speed/2	
		if (grounded) {
			sprite_index = sprite_speed_up
		} else {
			sprite_index = sprite_air_move	
		}
	} else {
		dash = 2
		if (grounded) {
			sprite_index = sprite_dash
		} else {
			sprite_index = sprite_air_move	
		}
	}
}


if (keyboard_check(vk_left)) {
	image_xscale = -scale	
	x += image_xscale*dash
	alarm[1] += 1
}
if (keyboard_check(vk_right)) {
	image_xscale = scale	
	x += image_xscale*dash
	alarm[1] += 1
}
if (keyboard_check_pressed(vk_up)) {
	if (grounded) {
		sprite_index = sprite_jump
	} else {
		sprite_index = sprite_air_jump
	}
	alarm[0] = room_speed*3
}

if (alarm[0] > 0) {
	y -= image_yscale * 3 * (alarm[0] / (room_speed*3))
}

if (keyboard_check(vk_down)) {
	y += 100	
}
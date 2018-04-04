/// @description 

draw_count++
var _update = false

if (y != 575) {
	y = min(round(y + (image_yscale*1.5)), 575)
	grounded = false
	
	if (y = 575) {
		_update = true	
	}
} else {
	grounded = true
}

if (((keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)) and (grounded) and (sprite_index != sprite_hold_shield)) or (_update)) {
	if (alarm[1] <= 0) {
		alarm[1] = room_speed/2	
		if (grounded) {
			sprite_index = sprite_speed_up
			image_index = 0
		} else {
			sprite_index = sprite_air_move	
			image_index = 0
		}
	} else {
		dash = 2
		if (grounded) {
			sprite_index = sprite_dash
			image_index = 0
		} else {
			sprite_index = sprite_air_move	
			image_index = 0
		}
	}
}

if (sprite_index = sprite_roll) {
	x += image_xscale*dash*2
} else {	
	if (keyboard_check(vk_left)) {
		image_xscale = -scale	
		x += image_xscale*dash
		alarm[1] += 1
		if (sprite_index = sprite_hold_shield) {
			sprite_index = sprite_roll	
			image_index = 0
		}
	}
	if (keyboard_check(vk_right)) {
		image_xscale = scale	
		x += image_xscale*dash
		alarm[1] += 1
		if (sprite_index = sprite_hold_shield) {
			sprite_index = sprite_roll	
			image_index = 0
		}
	}

	if (keyboard_check_pressed(vk_up)) {
		if (grounded) {
			sprite_index = sprite_jump
			image_index = 0
		} else {
			sprite_index = sprite_air_jump
			image_index = 0
		}
		alarm[0] = room_speed*3
	}
}
if (alarm[0] > 0) {
	y -= image_yscale * 3 * (alarm[0] / (room_speed*3))
}

if (keyboard_check(vk_down)) {
	if (!grounded) {
		y += 100	
	}
	if (sprite_index = sprite_hold_shield) {
		sprite_index = sprite_dodge
		image_index = 0
	}
}

if (sprite_shield != -1) {
	if (grounded and keyboard_check(ord("S"))) {
		if ((sprite_index != sprite_shield) and (sprite_index != sprite_hold_shield) and (sprite_index != sprite_un_shield) and (sprite_index != sprite_roll) and (sprite_index != sprite_dodge)) {
			sprite_index = sprite_shield	
			image_index = 0
		}
	} else {
		if (sprite_index = sprite_hold_shield) {
			sprite_index = sprite_un_shield
			image_index = 0	
		}
	}
}


last_x2 = last_x
last_x = xprevious
last_y2 = last_y
last_y = yprevious
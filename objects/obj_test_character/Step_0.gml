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
		if (grounded) {
			image_xscale = -scale	
		}
		x += -scale*dash
		alarm[1] += 1
		if (sprite_index = sprite_hold_shield) {
			sprite_index = sprite_roll	
			image_index = 0
		}
	}
	if (keyboard_check(vk_right)) {
		if (grounded) {
			image_xscale = scale	
		}
		x += scale*dash
		alarm[1] += 1
		if (sprite_index = sprite_hold_shield) {
			sprite_index = sprite_roll	
			image_index = 0
		}
	}

	if (keyboard_check_pressed(vk_space)) {
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

if (keyboard_check(vk_down) and keyboard_check(ord("M"))) {
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




xaxis = keyboard_check(vk_right) - keyboard_check(vk_left)
xaxis *= sign(image_xscale)
yaxis = keyboard_check(vk_down) - keyboard_check(vk_up)
prev_sprite_index = sprite_index


if (keyboard_check_pressed(ord("Z"))) {
if (grounded) {
	switch (string(string(xaxis) + ", " + string(yaxis))) {
		case "0, 0": //neutral
			sprite_index = sprite_jab
			image_index = 0
		break;
		
		case "1, 0": //right
			sprite_index = sprite_tilt_forward
			image_index = 0
		break;
		
		case "0, 1": // down
			sprite_index = sprite_tilt_down
			image_index = 0
		break;
		
		case "-1, 0": // left
		break;
		
		case "0, -1": //up
			sprite_index = sprite_tilt_up
			image_index = 0
		break;
	}
} else {
	switch (string(string(xaxis) + ", " + string(yaxis))) {
		case "0, 0": //neutral
			sprite_index = sprite_aerial_neutral
			image_index = 0
		break;
		
		case "1, 0": //right
			sprite_index = sprite_aerial_forward
			image_index = 0
		break;
		
		case "0, 1": // down
			sprite_index = sprite_aerial_down
			image_index = 0
		break;
		
		case "-1, 0": // left
			sprite_index = sprite_aerial_back
			image_index = 0
		break;
		
		case "0, -1": //up
			sprite_index = sprite_aerial_up
			image_index = 0
		break;
	}
}
}

if (keyboard_check_pressed(ord("X"))) {
	switch (string(string(xaxis) + ", " + string(yaxis))) {
		case "0, 0": //neutral
		break;
		
		case "1, 0": //right
			sprite_index = sprite_smash_forward
			image_index = 0
		break;
		
		case "0, 1": // down
			sprite_index = sprite_smash_down
			image_index = 0
		break;
		
		case "-1, 0": // left
		break;
		
		case "0, -1": //up
			sprite_index = sprite_smash_up
			image_index = 0
		break;
	}
}


if (keyboard_check_pressed(ord("C"))) {
	switch (string(string(xaxis) + ", " + string(yaxis))) {
		case "0, 0": //neutral
			sprite_index = sprite_special_neutral
			image_index = 0
		break;
		
		case "1, 0": //right
			sprite_index = sprite_special_forward
			image_index = 0
		break;
		
		case "0, 1": // down
			sprite_index = sprite_special_down
			image_index = 0
		break;
		
		case "-1, 0": // left
		break;
		
		case "0, -1": //up
			sprite_index = sprite_special_up
			image_index = 0
		break;
	}
}


if (sprite_index = -1) {
	sprite_index = prev_sprite_index
}
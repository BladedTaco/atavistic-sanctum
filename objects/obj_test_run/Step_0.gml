/// @description 

if (sprite_index = sprite_run or sprite_index = sprite_walk) {
	if (sprite_index = sprite_run) {
		x += image_xscale
	}
	x += image_xscale*2

	if (x > room_width and sign(image_xscale) = 1) {
		x -= room_width + sprite_width	
	}
	if (x < -abs(sprite_width) and sign(image_xscale) = -1) {
		x = room_width + abs(sprite_width)
	}
}

if (dashes) {
	if (sprite_index = sprite_speed_up or sprite_index = sprite_dash or sprite_index = sprite_speed_down or sprite_index = sprite_dash_slow) {
		if (sprite_index = sprite_dash or sprite_index = sprite_dash_slow) {
			x += image_xscale
		}
		x += image_xscale
	}
}




last_x2 = last_x
last_x = xprevious
last_y2 = last_y
last_y = yprevious
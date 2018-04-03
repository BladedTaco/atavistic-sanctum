/// @description

if (sprite_index != sprite_idle) {
	if (sprite_index = sprite_dash) {
		sprite_index = sprite_run
	} else if (sprite_index = sprite_speed_up) {
		sprite_index = sprite_walk
	} else if (sprite_index = sprite_dash_slow) {
		if (irandom(100) < 80) {
			sprite_index = sprite_dash
			image_xscale *= -1
		} else {
			sprite_index = sprite_idle
		}
	} else if (sprite_index = sprite_speed_down) {
		sprite_index = sprite_idle
	} else {
		if (irandom(100) < 90) {
			image_index = 2
		} else {
			if (dashes) {
				if (sprite_index = sprite_walk) {
					sprite_index = sprite_speed_down
				} else if (sprite_index = sprite_run) {
					sprite_index = sprite_dash_slow
				}
			} else {
				sprite_index = sprite_idle
				image_xscale *= choose(-1, 1)
			}
		}
	}
} else {
	if (dashes) {
		sprite_index = choose(sprite_speed_up, sprite_dash)
	} else {
		sprite_index = choose(sprite_walk, sprite_run)
	}
}
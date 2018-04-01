/// @description

if (sprite_index != sprite_idle) {
	if (irandom(100) < 90) {
		image_index = 2
	} else {
		sprite_index = sprite_idle
		image_xscale *= choose(-1, 1)
	}
} else {
	sprite_index = choose(sprite_walk, sprite_run)
}
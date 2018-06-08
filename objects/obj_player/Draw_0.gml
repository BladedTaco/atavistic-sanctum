///@desc draw effects
image_blend = c_white

if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}

if (obj_match_handler.state[player_number] = AIR_DODGING) {
	image_blend = c_dkgray
}
draw_self();

draw_set_colour(c_aqua)
draw_line(x, y, x + momentum_x, y + momentum_y)

if (sprite_index != sprite[0, 0]) or (floor(image_index) != sprite[0, 1]) or (image_xscale != sprite[0, 2]) {
	for (var i = array_height_2d(sprite) - 1; i >= 0; i--) {
		sprite[i + 1, 0] = sprite[i, 0]
		sprite[i + 1, 1] = sprite[i, 1]
		sprite[i + 1, 2] = sprite[i, 2]
	}

	sprite[0, 0] = sprite_index
	sprite[0, 1] = floor(image_index)
	sprite[0, 2] = image_xscale
}

for (var i = 0; i < min(array_height_2d(sprite), 30); i++) {
	draw_sprite_ext(sprite[i, 0], sprite[i, 1], i*25, 100, sprite[i, 2], 1, 0, c_white, 1)
}
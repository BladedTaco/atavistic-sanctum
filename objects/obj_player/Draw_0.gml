///@desc draw effects
image_blend = c_white

if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}

if (obj_match_handler.state[player_number] = AIR_DODGING) {
	image_blend = c_gray
}
draw_self();


draw_set_colour(c_aqua)
draw_line(x, y, x + momentum_x, y + momentum_y)
draw_set_colour(c_lime)
draw_circle(effective_x, effective_y, 2, false)
draw_set_colour(c_orange)
draw_line(effective_x, effective_y, effective_x + momentum_x, effective_y + momentum_y)


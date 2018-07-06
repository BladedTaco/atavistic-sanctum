///@desc draw effects

//check for outline colour changes
surface_set_target(pal_surface)
draw_point_colour(1, 0, c_black)

if (alarm[2] >= 0) { //smash charge flash
	if (floor(image_index) = smash_frame) {
		if (round(draw_count/6) mod 2 = 0) {
			draw_point_colour(1, 0, c_yellow)
		}
	}
}
if (alarm[5] >= 0) { //grab colour fade
	draw_point_colour(1, 0, merge_colour(c_black, c_white, alarm[5]/(GAME_SPEED*5)))
}
if (alarm[0] >= 0) { //ledge colour fade
	if (obj_match_handler.state[player_number] = LEDGE) {
		draw_point_colour(1, 0, merge_colour(c_black, c_white, alarm[0]/(GAME_SPEED*3)))
	}
}

surface_reset_target()


image_blend = img_blend
pal_swap_set(pal_surface, 1, true)

if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}


switch (obj_match_handler.state[player_number]) {
	case AIR_DODGING:
		image_blend = c_gray
	break;
	case FREEFALL:
		//make image blend a triangle wave transition between a dark colour and a light colour
		image_blend = merge_colour($8f8f8f, $fafafa, scr_triangle_wave(0.5, GAME_SPEED/2, 0, -0.5, draw_count))
	break;
}
draw_self();

pal_swap_reset()

if (debug_mode) {
	draw_set_colour(c_aqua)
	draw_line(x, y, x + momentum_x, y + momentum_y)
	draw_set_colour(c_lime)
	draw_circle(x + effective_x, y + effective_y, 2, false)
	draw_set_colour(c_orange)
	draw_line(x + effective_x, y + effective_y, x + effective_x + momentum_x, y + effective_y + momentum_y)


	draw_set_colour(c_olive)
	draw_circle(clamp(x, 0, room_width), clamp(y, 0, room_height), 3, false)
}


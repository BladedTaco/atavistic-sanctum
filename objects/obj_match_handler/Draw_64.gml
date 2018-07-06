/// @description 

draw_set_valign(fa_center)
draw_set_font(fnt_pixel_3)
draw_rectangle_colour(0, display_get_gui_height(), display_get_gui_width(), display_get_gui_height() - 45, $3f3f3f, $3f3f3f, $3f3f3f, $3f3f3f, false)
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		var _xx = round(display_get_gui_width()*((player_number + 0.5)/(global.player_number)) + 5)
		var _yy = round(display_get_gui_height() + max((1 - (draw_count/GAME_SPEED))*50, 0))
		if (dead) {
			var _inst;
			for (var o = 0; o < min(array_length_2d(obj_results.kills, player_number), 4); o++) {
				_inst = obj_results.kills[player_number, o]
				if (_inst >= 0) {
					with (other.player[_inst]) {
						pal_swap_set(pal_surface, 1, true)
						draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy - 20, 2, 2, 0, img_blend, 0.5)
						pal_swap_reset()
					}
				}
			}
			for (var o = 0; o < min(array_length_2d(obj_results.deaths, player_number), 4); o++) {
				_inst = obj_results.deaths[player_number, o]
				if (_inst >= 0) {
					with (other.player[_inst]) {
						pal_swap_set(pal_surface, 1, true)
						draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy, 2, 2, 0, img_blend, 0.5)
						pal_swap_reset()
					}
				}
			}
			draw_text_normal(_xx - 45, _yy - 36, "K")
			draw_text_normal(_xx - 45, _yy - 16, "D")
		} else {
			for (var o = 0; o < stocks; o++) {
				draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 5, c_black, c_black, false)
				draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 3, player_col, player_col, false)
			}
			draw_text_outlined(_xx + 25, _yy - 25, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 2)
			draw_healthbar(_xx - 5, _yy, _xx + 50, _yy - 5, 100*shield_percentage/shield_max_percentage, c_black, c_red, c_green, 0, true, false)
			if (max_jumps > 0) { draw_healthbar(_xx - 57, _yy, _xx - 52, _yy - 30, 100*other.jumps[player_number]/max_jumps, c_black, c_red, c_green, 2, true, false) }
			pal_swap_set(pal_surface, 1, true)
			draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx - 30, _yy, 3, 3, 0, image_blend, 1)
			pal_swap_reset()
		}
		if (spawning) {
			if (instance_exists(attacker)) {
				with (attacker) {
					pal_swap_set(pal_surface, 1, true)
					draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx, display_get_gui_height() - 5, 3, 3, 0, img_blend, 1 - (other.draw_count/GAME_SPEED))
					pal_swap_reset()
				}
			}	
		}
	}
}

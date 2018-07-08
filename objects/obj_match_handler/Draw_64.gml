/// @description 

var _alpha = 1
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		draw_set_valign(fa_center)
		draw_set_font(fnt_pixel_3)
		var _xx = round(display_get_gui_width()*((player_number + 0.5)/(global.player_number)) + 5)
		var _yy = round(display_get_gui_height() + max((1 - (draw_count/GAME_SPEED))*50, 0))
		var _xx2 = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])*((player_number + 0.5)/(global.player_number)) + 5)
		var _scl = camera_get_view_width(view_camera[0])/display_get_gui_width()
		if (collision_rectangle(_xx2 - 50*_scl, room_height + 100, _xx2 + 50*_scl, room_height - 45*_scl, obj_player, false, false)) {
			draw_set_alpha(0.4)
			_alpha = 0.4
		} else {
			draw_set_alpha(1)
			_alpha = 1
		}
		if (dead) {
			draw_set_alpha(0.5)
			var _inst;
			for (var o = 0; o < min(array_length_2d(obj_results.kills, player_number), 4); o++) {
				_inst = obj_results.kills[player_number, o]
				if (_inst >= 0) {
					with (other.player[_inst]) {
						pal_swap_set(pal_surface, 1, true)
						draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy - 20, 2, 2, 0, img_blend, 0.5*_alpha)
						pal_swap_reset()
					}
				}
			}
			for (var o = 0; o < min(array_length_2d(obj_results.deaths, player_number), 4); o++) {
				_inst = obj_results.deaths[player_number, o]
				if (_inst >= 0) {
					with (other.player[_inst]) {
						pal_swap_set(pal_surface, 1, true)
						draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy, 2, 2, 0, img_blend, 0.5*_alpha)
						pal_swap_reset()
					}
				}
			}
			draw_text_normal(_xx - 45, _yy - 36, "K")
			draw_text_normal(_xx - 45, _yy - 16, "D")
			draw_set_alpha(1)
		} else {
			for (var o = 0; o < stocks; o++) {
				draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 5, c_black, c_black, false)
				draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 3, player_col, player_col, false)
			}
			draw_text_outlined(_xx + 25, _yy - 25, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 2)
			draw_healthbar(_xx - 5, _yy, _xx + 50, _yy - 5, 100*shield_percentage/shield_max_percentage, c_black, c_red, c_green, 0, true, false)
			if (max_jumps > 0) { draw_healthbar(_xx - 57, _yy, _xx - 52, _yy - 30, 100*other.jumps[player_number]/max_jumps, c_black, c_red, c_green, 2, true, false) }
			pal_swap_set(pal_surface, 1, true)
			draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx - 30, _yy, 3, 3, 0, image_blend, _alpha)
			pal_swap_reset()
			
			//draw attacker if just died
			if (spawning) {
				if (instance_exists(attacker)) {
					with (attacker) {
						pal_swap_set(pal_surface, 1, true)
						draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx, display_get_gui_height() - 5, 3, 3, 0, img_blend, _alpha*(1 - (other.draw_count/GAME_SPEED)))
						pal_swap_reset()
					}
				}	
			}
			
			//draw marker
			_scl = 1/_scl
			draw_set_alpha(1)
			draw_set_halign(fa_center)
			draw_set_valign(fa_bottom)
			draw_set_font(fnt_pixel_2)
			var _d = degtorad(-image_angle)
			_xx = (x + effective_x)*_scl + (45*_scl)*sin(_d) - camera_get_view_x(view_camera[0])*_scl
			_yy = (y + effective_y)*_scl - (45*_scl)*cos(_d) - camera_get_view_y(view_camera[0])*_scl
			draw_sprite_ext(spr_marker, 0, _xx, _yy, 2, 2, 0, player_col, 1)
			draw_text_outlined(_xx, _yy - 10, c_black, player_col, name, 2)
			draw_text_outlined(_xx, _yy - 24, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 2)
		}
	}
}

if (global.player_outside) {
	draw_set_alpha(0.5)
	global.player_outside = false
	draw_set_colour(c_white)
	draw_rectangle(25 + obj_blast_zone.bbox_left/10, 25 + obj_blast_zone.bbox_top/10, 25 + obj_blast_zone.bbox_right/10, 25 + obj_blast_zone.bbox_bottom/10, true)
	draw_rectangle(25, 25, 25 + room_width/10, 25 + room_height/10, true)
	with (obj_player) {
		if (!dead) {
			draw_circle_colour(25 + (x+effective_x)/10, 25 + (y+effective_y)/10, 3, player_col, player_col, false)
		}
	}
	draw_set_alpha(1)
}
/// @description 
if !(surface_exists(menu_surface)) {
	active = false
	event_user(0) //repopulate menu
}
if !(active) {
	surface_set_target(menu_surface)
	draw_clear_alpha(c_ltgray, 1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_pixel_2)
	
	//draw box behind selected option
	draw_set_colour(c_maroon)
	if (state = 4) {
		for (var i = 0; i < menu_length; i++) {
			for (var o = 0; o < menu_width; o++) {
				if (obj_match_handler.player[o+1].character = i) {
					var j = i*GUI_HEIGHT*0.05
					draw_rectangle(o*(surface_get_width(menu_surface)/menu_width), j, (o+1)*(surface_get_width(menu_surface)/menu_width) - 1, j + GUI_HEIGHT*0.05 - 1, false)	
				}
			}
		}
	} else {
		i = menu_index*GUI_HEIGHT*0.05
		draw_rectangle(0, i, surface_get_width(menu_surface) - 1, i + GUI_HEIGHT*0.05 - 1, false)	
	}
	
	//draw options
	for (var i = 0; i < menu_length; i++) {
		if ((state = 2) or (state = 4)) {
			for (var o = 0; o < menu_width; o++) {
				draw_sprite_ext(menu_option[i], 0, (o+0.5)*GUI_WIDTH*0.05, (i+0.9)*GUI_HEIGHT*0.05, 2, 2, 0, c_white, 1)
			}
		} else {
			draw_text_outlined(surface_get_width(menu_surface)*0.5, (i+0.5)*GUI_HEIGHT*0.05, c_black, c_white, menu_option[i], 2)
		}
	}
	surface_reset_target();
	active = true
}
//draw the menu surface with correct offset
draw_surface_part(menu_surface, 0, menu_offset*GUI_HEIGHT*0.05, surface_get_width(menu_surface), min(GUI_HEIGHT - y, surface_get_height(menu_surface)), x, y)

//draw selector
draw_set_alpha(0.4)
draw_set_colour(c_aqua)
var i = (menu_index - menu_offset)*GUI_HEIGHT*0.05
var o = surface_get_width(menu_surface)/menu_width
draw_rectangle(x + sub_index*o, y + i, x + (sub_index+1)*o - 1, y + i + GUI_HEIGHT*0.05 - 1, false)

draw_set_alpha(1)
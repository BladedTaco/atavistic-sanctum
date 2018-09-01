/// @description draw menu
if (!surface_exists(menu_surface)) { //if there is no menu surface
	menu_surface = surface_create(GUI_WIDTH*0.3, GUI_HEIGHT*0.05*menu_length)
	surface_set_target(menu_surface)
	draw_clear_alpha(c_teal, 1)
	//populate the menu surface
	draw_set_font(fnt_pixel_2)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	for (var i = 0; i < array_length_1d(menu_option); i++) {
		draw_text_outlined(20, GUI_HEIGHT*0.05*i + GUI_HEIGHT*0.025, c_black, c_white, menu_option[i], 2)
	}
	surface_reset_target();
}
//draw background rectangle
draw_set_colour(c_maroon)
draw_rectangle(x, y, x + GUI_WIDTH, y + GUI_HEIGHT, false)

var _yy = surface_get_height(menu_surface) - menu_index*GUI_HEIGHT*0.05
draw_surface_part(menu_surface, 0, menu_index*GUI_HEIGHT*0.05, GUI_WIDTH*0.3, _yy, x, y + GUI_HEIGHT*0.05)
while (_yy < GUI_HEIGHT) {
	//draw the menu surface repeatedly
	draw_surface_part(menu_surface, 0, 0, GUI_WIDTH*0.3, surface_get_height(menu_surface), x, _yy + y + GUI_HEIGHT*0.05)
	_yy += surface_get_height(menu_surface)
}

//draw the current menu option
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_colour(c_aqua)
draw_rectangle(x, y, x + GUI_WIDTH*0.35, y + GUI_HEIGHT*0.1, false)
draw_text_outlined(x + 20, y + GUI_HEIGHT*0.05, c_dkgray, c_ltgray, menu_option[menu_index], 4)

//draw the stats
draw_set_font(fnt_pixel_4)
for (var i = 0; i < CHARACTER_NUMBER; i++) {
	draw_set_halign(fa_center)
	var _yy = (i+0.8)*GUI_HEIGHT/(1+CHARACTER_NUMBER)
	var _yy2 = (i+0.4)*GUI_HEIGHT/(1+CHARACTER_NUMBER)
	draw_sprite_ext(scr_get_sprite_simple(i, "stock"), 0, x + GUI_WIDTH*0.55, (i+1)*GUI_HEIGHT*0.2, 6, 6, 0, c_white, 1)
	draw_text_outlined(x + GUI_WIDTH*0.85, _yy, c_black, c_white, sub_menu_option[i*2], 4)
	draw_text_outlined(x + GUI_WIDTH*0.85, _yy2, c_black, c_white, sub_menu_option[i*2 + 1], 4)
	draw_set_halign(fa_right)
	draw_text_outlined(x + GUI_WIDTH*0.75, _yy, c_black, c_white, "GAMES:", 4)
	draw_text_outlined(x + GUI_WIDTH*0.75, _yy2, c_black, c_white, "WINS:", 4)
	draw_set_colour(c_black)
	draw_line_width(x + GUI_WIDTH*0.75, 4 + (_yy + _yy2)/2, x + GUI_WIDTH*0.95, 4 + (_yy + _yy2)/2, 4)
}																										
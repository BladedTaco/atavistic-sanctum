/// @description 
var _xx = x
var _yy = y
var j = GUI_WIDTH*0.1
draw_set_colour($4ad64a)
draw_set_font(fnt_pixel_3)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_rectangle(_xx - GUI_WIDTH*0.5 + j, _yy - GUI_HEIGHT*0.5 + j, _xx + GUI_WIDTH*0.5 - j, _yy + GUI_HEIGHT*0.5 - j, false)
draw_text_outlined(_xx, _yy - GUI_HEIGHT*0.475 + j, c_black, c_white, name, 3)
if (state = 2) { //name menu
	draw_set_font(fnt_pixel_4)
	draw_text_outlined(_xx, _yy - GUI_HEIGHT*0.41 + j, c_black, c_white, sub_name, 4)
	draw_set_font(fnt_pixel_3)
	for (var i = 0; i < menu_length - 1; i++) {
		_xx = x + (i div 6)*GUI_WIDTH*0.11 - GUI_WIDTH*0.325
		_yy = y + (i mod 6)*GUI_HEIGHT*0.075 - GUI_HEIGHT*(0.125 - 0.02)
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.03, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.03, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
	if (active) { //menu options aren't set for first draw, so avoid this throwing an error
		_xx = x + GUI_WIDTH*0.27
		_yy = y + GUI_HEIGHT*0.08
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.08, _yy - GUI_HEIGHT*0.15, _xx + GUI_WIDTH*0.08, _yy + GUI_HEIGHT*0.15, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
} else if (state = 3) { //controller option menu
	for (var i = 0; i < menu_length; i++) {
		_xx = x  - GUI_WIDTH*0.175
		_yy = y + i*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.125, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
	_yy = y - GUI_HEIGHT*(0.25 - 0.025)
	//100*(val - min)/(max - min)  percentage of a range
	var val = obj_input.c_stick_deadzone[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val - 0.01)/0.89, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.14/0.89), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.14/0.89), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
		
	_yy = y + 1*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
	val = obj_input.l_stick_deadzone[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val - 0.01)/0.89, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.14/0.89), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.14/0.89), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
	
	_yy = y + 2*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
	val = obj_input.l_stick_neutral[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val - 0.01)/0.94, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.49/0.94), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.49/0.94), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
		
	_yy = y + 3*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
	val = obj_input.smash[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val - 0.01)/0.99, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.29/0.99), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.29/0.99), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
		
	_yy = y + 4*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
	val = obj_input.smash_deadzone[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val - 0.01)/0.98, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.24/0.98), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(0.24/0.98), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
		
	_yy = y + 5*GUI_HEIGHT*0.08 - GUI_HEIGHT*(0.25 - 0.025)
	var val = obj_input.trigger_threshold[creator.player_number]
	draw_healthbar(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.3, _yy + GUI_HEIGHT*0.03, 100*(val + 1)/1.95, c_black, $caffac, $faccaf, 0, true, true)
	draw_text_outlined(_xx + GUI_WIDTH*0.4, _yy - 4, c_black, c_white, string(val), 3)
	draw_line_width_colour(_xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(1.5/1.95), _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15 + GUI_WIDTH*0.15*(1.5/1.95), _yy + GUI_HEIGHT*0.03, 2, c_red, c_aqua)
} else { //normal menu
	for (var i = 0; i < menu_length; i++) {
		_xx = x + (i div 6)*GUI_WIDTH*0.35 - GUI_WIDTH*0.175
		_yy = y + (i mod 6)*GUI_HEIGHT*0.1 - GUI_HEIGHT*(0.25 - 0.025)
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.125, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
}
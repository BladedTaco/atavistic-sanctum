/// @description draw menu
var _xx = x
var _yy = y
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel_4)
draw_set_colour($5f5f5f) //dark gray
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false) //background colour
for (var i = 0; i < player_number; i++) {
	if (cursor_y[i] > 25) {
		_yy = y + 25	
	}
	if (col[i] = 1) {
		draw_set_colour(player_col[i])
		draw_rectangle(_xx + GUI_WIDTH*0.05, _yy, _xx + GUI_WIDTH*0.35, _yy + 25, false)
	}
	if (col[i] = 2) {
		draw_set_colour(player_col[i])
		draw_rectangle(_xx + GUI_WIDTH*0.6, _yy, _xx + GUI_WIDTH*0.93, _yy + 25, false)
	}
	_yy = y
}
if (stocks > 0) { 
	draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + 20, c_black, c_white, "Stocks     " + string(stocks), 4)
} else {
	draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + 20, c_black, c_white, "Stocks     INFINITE", 4)
}
if (time > 0) {
	if (time >= 60) {
		var _str = "Time     " + string(time div 60) + ":"
		if (time mod 60 < 10) {
			_str += "0"	
		}
		_str += string(time mod 60) + ":00"
		draw_text_outlined(_xx + GUI_WIDTH*0.775, _yy + 20, c_black, c_white, _str, 4)
	} else {
		draw_text_outlined(_xx + GUI_WIDTH*0.775, _yy + 20, c_black, c_white, "Time     " + string(time) + ":00", 4)
	}
} else {
	draw_text_outlined(_xx + GUI_WIDTH*0.775, _yy + 20, c_black, c_white, "Time     FOREVER", 4)	
}


draw_set_colour($eeeeee) //faded white
draw_rectangle(_xx, _yy + 50, _xx + GUI_WIDTH, _yy + GUI_HEIGHT*0.75, false) //middle section colour
//draw character selection icons with pallet swap applied
pal_swap_set(pal_bal, pal[0], false)
draw_sprite_ext(spr_bal_stock, 0, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
pal_swap_reset();
pal_swap_set(pal_mac, pal[1], false)
draw_sprite_ext(spr_mac_stock, 0, _xx + GUI_WIDTH*0.375, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
pal_swap_reset();
pal_swap_set(pal_geo, pal[2], false)
draw_sprite_ext(spr_geo_stock, 0, _xx + GUI_WIDTH*0.625, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
pal_swap_reset();
pal_swap_set(pal_eth, pal[3], false)
draw_sprite_ext(spr_eth_stock, 0, _xx + GUI_WIDTH*0.875, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
pal_swap_reset();
_yy = y + GUI_HEIGHT/2 + 10
for (var i = 0; i < 10; i++) {
	draw_set_colour(make_colour_hsv(i*25.5, 255, 255))
	for (var o = 1; o < 5; o++) {
		if (pal[o-1] = i) {
			_xx = x + GUI_WIDTH*o*(0.25 - 0.125/o) + ((i-4.5)*20)
			draw_rectangle(_xx - 10, _yy - 10, _xx + 9, _yy + 30, false) //colour pallet chooser
		} else {
			_xx = x + GUI_WIDTH*o*(0.25 - 0.125/o) + ((i-4.5)*20)
			draw_rectangle(_xx - 10, _yy - 10, _xx + 9, _yy + 10, false) //colour pallet chooser
		}
	}
}
_yy = y
_xx = x

draw_set_font(fnt_pixel_2)
for (var i = 0; i < player_number; i++) {
	draw_text_outlined(_xx + GUI_WIDTH*0.25*character[i] + GUI_WIDTH*0.125 - 78 + ((i+1)/8)*150, _yy + GUI_HEIGHT/2 - 110, c_black, c_white, string(i+1), 2)
	draw_set_colour(player_col[i])
	draw_rectangle(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.75, _xx + GUI_WIDTH*((i + 1)/min(player_number + 1, 8)), _yy + GUI_HEIGHT, false) //player back colour
	if (sprite_exists(sprite[i])) {
		pal_swap_set(pal_sprite[i], pallet[i], false)
		draw_sprite_ext(sprite[i], 0, _xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), _yy +	GUI_HEIGHT*0.85, 5, 5, 0, c_white, 1)
		pal_swap_reset();
	}
	draw_line_width_colour(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.85, _xx + GUI_WIDTH*((i+1)/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.85, 4, c_black, c_black)
	draw_line_width_colour(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.925, _xx + GUI_WIDTH*((i+1)/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.925, 4, c_black, c_black)
	draw_text_outlined(_xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.88, c_black, c_white, "UNASSIGN", 2)
	draw_text_outlined(_xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.955, c_black, c_white, name[i], 2)
	draw_line_width_colour(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.75, _xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT + 1, 5, c_ltgray, c_black)
}	
draw_line_width_colour(_xx - 1, _yy + GUI_HEIGHT*0.75, _xx + GUI_WIDTH, _yy + GUI_HEIGHT*0.75, 6, c_ltgray, c_ltgray) //seperating line

if (player_number < 8) {
	draw_text_outlined(_xx + GUI_WIDTH*((player_number + 0.5)/(player_number + 1)), _yy + GUI_HEIGHT*0.875, c_black, c_white, "MORE PLAYERS?", 2)
}

var _start = true

for (var i = 0; i < player_number; i++) {
	draw_sprite_ext(spr_cursor, 0, _xx + cursor_x[i], _yy + cursor_y[i], 2, 2, 0, player_col[i], 1)
	draw_text_outlined(_xx + cursor_x[i] + 18, _yy + cursor_y[i] + 14, c_black, c_white, "P" + string(i + 1), 2)
	if (character[i] < 0) {
		_start = false	
	}
}

if ((player_number > 1) and (_start)) {
	draw_set_font(fnt_pixel_4)
	draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT*0.15, c_black, c_white, "PRESS PAUSE TO START", 4)
}
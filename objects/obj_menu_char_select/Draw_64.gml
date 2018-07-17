/// @description draw menu
var _xx = x
var _yy = y
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel_4)
draw_set_colour($5f5f5f) //very dark gray
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false) //background colour
draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + 20, c_black, c_white, "Stocks     " + string(stocks), 4)
draw_text_outlined(_xx + GUI_WIDTH*0.8, _yy + 20, c_black, c_white, "Time     " + time, 4)
draw_set_colour($eeeeee) //faded white
draw_rectangle(_xx, _yy + 50, _xx + GUI_WIDTH, _yy + GUI_HEIGHT*0.75, false) //middle section colour
draw_sprite_ext(spr_bal_stock, 0, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
draw_sprite_ext(spr_mac_stock, 0, _xx + GUI_WIDTH*0.375, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
draw_sprite_ext(spr_geo_stock, 0, _xx + GUI_WIDTH*0.625, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
draw_sprite_ext(spr_eth_stock, 0, _xx + GUI_WIDTH*0.875, _yy + GUI_HEIGHT/2, 10, 10, 0, c_white, 1)
_yy = y + GUI_HEIGHT/2 + 10
for (var i = 0; i < 10; i++) {
	draw_set_colour(make_colour_hsv(i*25.5, 255, 255))
	for (var o = 1; o < 5; o++) {
		_xx = x + GUI_WIDTH*o*(0.25 - 0.125/o) + ((i-4.5)*20)
		draw_rectangle(_xx - 10, _yy - 10, _xx + 10, _yy + 10, false) //colour pallet chooser
	}
}
_yy = y
_xx = x

for (var i = 0; i < player_number; i++) {
	draw_set_colour(make_colour_hsv((i*255)/player_number, 255, 255))
	draw_rectangle(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), _yy + GUI_HEIGHT*0.75, _xx + GUI_WIDTH*((i + 1)/min(player_number + 1, 8)), _yy + GUI_HEIGHT, false) //player back colour
	if (sprite_exists(sprite[i])) {
		draw_sprite_ext(sprite[i], 0, _xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), GUI_HEIGHT*0.85, 5, 5, 0, c_white, 1)
	}
	draw_line_width_colour(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), GUI_HEIGHT*0.85, _xx + GUI_WIDTH*((i+1)/min(player_number + 1, 8)), GUI_HEIGHT*0.85, 4, c_black, c_black)
	draw_line_width_colour(_xx + GUI_WIDTH*(i/min(player_number + 1, 8)), GUI_HEIGHT*0.925, _xx + GUI_WIDTH*((i+1)/min(player_number + 1, 8)), GUI_HEIGHT*0.925, 4, c_black, c_black)
	draw_text_outlined(_xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), GUI_HEIGHT*0.8775, c_black, c_white, "UNASSIGN", 4)
	draw_text_outlined(_xx + GUI_WIDTH*((i + 0.5)/min(player_number + 1, 8)), GUI_HEIGHT*0.9525, c_black, c_white, name[i], 4)
}	
draw_line_width_colour(_xx - 1, GUI_HEIGHT*0.75, _xx + GUI_WIDTH, GUI_HEIGHT*0.75, 6, c_ltgray, c_ltgray) //seperating line

draw_set_font(fnt_pixel_2)
for (var i = 0; i < player_number; i++) {
	draw_sprite_ext(spr_cursor, 0, cursor_x[i], cursor_y[i], 2, 2, 0, c_white, 1)
	draw_text_outlined(cursor_x[i] + 18, cursor_y[i] + 14, c_black, c_white, "P" + string(player_number), 2)
}
/// @description Draw hitboxes and create hitboxes

//clear hitbox objects
scr_draw_hitboxes(global.show_hitboxes)	

/*
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_font(fnt_pixel)
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		var _d = degtorad(-image_angle)
		var _xx = x + effective_x + (45)*sin(_d)
		var _yy = y + effective_y - (45)*cos(_d)
		draw_sprite_ext(spr_marker, 0, _xx, _yy, 1, 1, 0, player_col, 1)
		draw_text_outlined(_xx, _yy - 6, c_black, player_col, name, 1)
		draw_text_outlined(_xx, _yy - 12, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 1)
	}
}

draw_set_font(fnt_pixel_2)
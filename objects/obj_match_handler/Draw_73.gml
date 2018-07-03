/// @description Draw hitboxes and create hitboxes

//clear hitbox objects
scr_draw_hitboxes(debug_mode)//hitbox)	


draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_font(fnt_pixel)
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		var _d = degtorad(-image_angle)
		var _xx = x + effective_x + (45)*sin(_d)
		var _yy = y + effective_y - (45)*cos(_d)
		draw_sprite(spr_marker, 0, _xx, _yy)
		draw_text_normal(_xx, _yy - 6, name)
	}
}

draw_set_font(fnt_pixel_2)
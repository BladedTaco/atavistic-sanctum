/// @description 

draw_set_valign(fa_bottom)
draw_set_font(fnt_pixel_3)
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		var _xx = display_get_gui_width()*((player_number + 0.5)/(global.player_number))
		var col = merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1))
		draw_text_outlined(_xx, display_get_gui_height() - 70, c_black, col, string(round(percentage)) + "%", 2)
		var _spr = scr_get_sprite(id, "idle")
		pal_swap_set(pal_surface, 1, true)
		draw_sprite_ext(scr_get_sprite(id, "shield_ball"), 0, _xx + 20, display_get_gui_height() - 50, 1, 1, 0, img_blend, (shield_percentage/shield_max_percentage))
		draw_sprite_ext(_spr, 0, _xx, display_get_gui_height() + sprite_get_yoffset(_spr)*3 - 80, 3, 3, 0, image_blend, 1)
		pal_swap_reset()
	}
}

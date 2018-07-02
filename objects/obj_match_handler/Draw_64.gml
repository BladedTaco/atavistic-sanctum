/// @description 

draw_set_valign(fa_top)
draw_set_font(fnt_pixel_huge)
for (var i = 0; i < global.player_number; i++) {
	with (player[i]) {
		pal_swap_set(global.pallet[character], 0.75, false)
		var _xx = display_get_gui_width()*((player_number + 0.5)/(global.player_number))
		draw_text_normal(_xx, display_get_gui_height() - 100, string(percentage) + "%")
		var _spr = scr_get_sprite(id, "idle")
		draw_sprite_ext(_spr, 0, _xx, display_get_gui_height() + sprite_get_height(_spr)*3 - 80, 3, 3, 0, c_white, 1)
		pal_swap_reset()
	}
}

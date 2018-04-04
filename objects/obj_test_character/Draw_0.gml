/// @description 

if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}

if (sprite_exists(sprite_index)) {
	draw_self()
	draw_text(x, 100, sprite_get_name(sprite_index))	
}

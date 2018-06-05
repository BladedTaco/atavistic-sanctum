/// @description 
draw_set_font(fnt_pixel_large)

if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}

if (sprite_exists(sprite_index)) {
	//draw_self()
	draw_text_normal(x, 100, sprite_get_name(sprite_index))	
}

if(keyboard_check(ord("A"))) {
	var _y = (sprite_height/2)
	if (character = "eth") { _y -= sprite_height/5 }
	draw_sprite_ext(sprite_shield_ball, draw_count, x, y - _y, image_xscale, image_yscale, draw_count, c_white, 0.5)
}

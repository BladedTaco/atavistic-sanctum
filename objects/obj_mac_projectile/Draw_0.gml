/// @description 
if (instance_exists(obj_match_handler) and instance_exists(creator)) {
	image_blend = creator.img_blend
	pal_swap_set(creator.pal_surface, 1, true)
	draw_sprite_ext(sprite_index, image_index + (image_number/2), x, y, 4, 4, 0, c_gray, 0.5)
	draw_self()
	pal_swap_reset()
}
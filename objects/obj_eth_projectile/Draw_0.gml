/// @description draw self
if (instance_exists(creator)) {
	if (creator.object_index = obj_player) {
		image_blend = creator.img_blend
		if (floor(image_index) = 6) {
			image_index = 0	
		}
		pal_swap_set(creator.pal_surface, 1, true)
		draw_self();
		pal_swap_reset()
	}
}
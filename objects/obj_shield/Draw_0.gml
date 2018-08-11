/// @description 
if (instance_exists(creator)) {
	image_alpha = min(creator.shield_percentage/creator.shield_max_percentage, 1)
	pal_swap_set(creator.pal_surface, 1, true)
	draw_self()
	pal_swap_reset()
}
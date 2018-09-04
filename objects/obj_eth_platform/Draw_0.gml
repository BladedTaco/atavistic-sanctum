/// @description draw self with blend and pallet
if (instance_exists(creator)) {
	image_blend = creator.img_blend
	pal_swap_set(creator.pal_surface, 1, true)
	draw_self();
	pal_swap_reset()
}
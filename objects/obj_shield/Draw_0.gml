/// @description draw shield
if (instance_exists(creator)) { //if there is a player to shield
	//set transparency to show shield meter, and draw shield with pallet swap
	image_alpha = min(creator.shield_percentage/creator.shield_max_percentage, 1)
	pal_swap_set(creator.pal_surface, 1, true)
	draw_self()
	pal_swap_reset()
}
/// @description check if custom colours need to be redrawn

if (!surface_exists(pal_surface)) {
	pal_surface = surface_create(16, 16)
	surface_set_target(pal_surface)
	draw_clear_alpha(c_white, 1)
	draw_sprite(pal_sprite, 0, 0, 0)
	surface_reset_target()
	for (var i = 0; i < global.player_number; i++) {
		if (instance_exists(player[i])) {
			with (player[i]) {
				if !(surface_exists(pal_surface)) {
					pal_surface = surface_create(16, 16) //colour pallet as a sprite
					surface_set_target(pal_surface)
					draw_clear_alpha(c_white, 1) //clear the surface
					pal_swap_draw_palette(global.pallet[character], 0, 0, 0) //draw base colours
					draw_surface_part(other.pal_surface, i, 0, 1, 16, 1, 0) //copy the pallet swap
					surface_reset_target() //reset the draw target
				}
			}
		}
	}
}
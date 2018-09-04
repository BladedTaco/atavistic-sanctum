/// @description check if custom colours need to be redrawn

if (!surface_exists(pal_surface)) { //if no pallet surface exists
	pal_surface = surface_create(16, 16) //create one
	surface_set_target(pal_surface) //set it as the draw target
	draw_clear_alpha(c_white, 1) //clear the surface
	draw_sprite(pal_sprite, 0, 0, 0) //draw the backup of the surface to it
	surface_reset_target() //reset the draw target
	for (var i = 0; i < global.player_number; i++) { //for each player
		if (instance_exists(player[i])) { //if the player exists
			with (player[i]) { //with that player
				if !(surface_exists(pal_surface)) { //if they dont have their pallet surfavec
					pal_surface = surface_create(16, 16) //create the pallet surface
					surface_set_target(pal_surface) //set it as the draw target
					draw_clear_alpha(c_white, 1) //clear the surface
					pal_swap_draw_palette(global.pallet[character], 0, 0, 0) //draw base colours
					draw_surface_part(other.pal_surface, i, 0, 1, 16, 1, 0) //copy the pallet swap
					surface_reset_target() //reset the draw target
				}
			}
		}
	}
}
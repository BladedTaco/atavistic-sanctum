///@func scr_start_training(state)
///@param state - the type of match start false = change room; true = create players
///@desc starts a training match with default settings
if (argument[0]) {
	instance_create(0, 0, obj_menu_training)
	var _inst = noone
	with (instance_create(0, 0, obj_match_handler)) { //create the match handler and pass variables through
		//set variables
		alarm[0] = -1
		global.player_number = 2
		starting = 0
		//create the characters
		for (var i = 0; i < global.player_number; i++) { 
			with (obj_spawn_point) { if (number = i) { _inst = id } } //get spawn point position
			with(instance_create(_inst.x, _inst.y, obj_player)) {
				//set base variables and references
				player_col = merge_colour(c_aqua, c_ltgray, i)
				player_number = i
				other.player[i] = id
				character = BAL
				stocks = -1
				if (i = 0) {
					name = "P1"
				} else {
					name = "DUMMY"
				}
				//set jumps
				max_jumps = 2
				if (character = MAC) { max_jumps = 0 }
				if (character = BAL) { max_jumps = 4 }
				//set shield
				shield_max_percentage = 30
				if (character = GEO) { shield_max_percentage = 50 }
				shield_percentage = shield_max_percentage
				//set to be spawning
				sprite_index = scr_get_sprite(id, "hurt_down")
				spawning = true
				image_alpha = 0
				img_blend = c_white
				
				//create pallet swap surface
				pal_surface = surface_create(16, 16) //colour pallet as a sprite
				surface_set_target(pal_surface)
				draw_clear_alpha(c_white, 1) //clear the surface
				pal_swap_draw_palette(global.pallet[character], 0, 0, 0) //draw base colours
				pal_swap_draw_palette(pal_bal, 0, 1, 0) //draw custom colours
				surface_copy_part(other.pal_surface, player_number, 0, pal_surface, 1, 0, 1, 16) //copy custom colours to global pallet backup
				surface_reset_target() //reset the draw target
			}
		}
		for (var i = 2; i < 8; i++) { //copy the rest of the pallets
			surface_copy_part(pal_surface, i, 0, obj_player.pal_surface, 1, 0, 1, 16) 
		}
		pal_sprite = sprite_create_from_surface(pal_surface, 0, 0, 16, 16, false, false, 0, 0)
	}
} else { //change room
	room_goto(rm_match_Training_Grounds)
}

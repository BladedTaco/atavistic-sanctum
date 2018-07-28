///@func scr_start_match(state)
///@param state - the type of match start false = change room; true = create players
///@desc starts a match by handing off data from the character select menu to the match handler

if (argument[0]) {
	var o = obj_menu_char_select
	var _inst = noone
	with (instance_create(0, 0, obj_match_handler)) { //create the match handler and pass variables through
		//set the time
		if (o.time > 0) {
			alarm[0] = o.time*60*GAME_SPEED + GAME_SPEED*3 //set timer
		} else {
			alarm[0] = -1 //set timer to never activate	
		}
		//create the characters
		for (var i = 0; i < global.player_number; i++) { 
			with (obj_spawn_point) { if (number = i) { _inst = id } } //get spawn point position
			with(instance_create(_inst.x, _inst.y, obj_player)) {
				//set base variables and references
				player_col = o.player_col[i]
				player_number = i
				other.player[i] = id
				character = o.character[i]
				stocks = o.stocks - 1
				name = o.name[i]
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
				pal_swap_draw_palette(o.pal_sprite[i], o.pallet[i], 1, 0) //draw custom colours
				surface_copy_part(other.pal_surface, player_number, 0, pal_surface, 1, 0, 1, 16) //copy custom colours to global pallet backup
				surface_reset_target() //reset the draw target
			}
		}
	}
} else {
	//go to the match room
	var _stage = asset_get_index("rm_match_" + string(get_integer("Select Stage:\n1 = stage 1\n2 = stage 2", 1)))
	if (room_exists(_stage)) { //if provided with a valid room
		room_goto(_stage) //go to that room
	} else { //otherwise
		room_goto(rm_match_1) //go to the first match room
	}
}

///@func scr_start_match(state, *room)
///@param state - the type of match start false = change room; true = create players
///@param *room - the match room, only needed if arg 1 is false
///@desc starts a match by handing off data from the character select menu to the match handler

if (argument[0]) {
	var o = obj_menu_char_select
	var _inst = noone
	with (instance_create(0, 0, obj_match_handler)) { //create the match handler and pass variables through
		//write rules for replay file header
		var _str = string(global.game_version) + "\n" + string_delete(room_get_name(room), 1, 9) + "\n" + string(o.stocks) + "\n" + string(o.time) + "\n" + string(global.player_number) + "\n"
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
				stocks = o.stocks
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
			//write the players data to the string
			_str += "\n" + string(i) + "\n" + string(player[i].name) + "\n" + string(player[i].character) + "\n" + string(o.pallet[i]) + "\n" + string(player[i].player_col) + "\n"
		}
		_str += "\n" + "\n" //add a gap
		header_string = _str //set the header string
		for (var i = 0; i < global.player_number; i++) { //add obj_input varibles after header
			_str += string(obj_input.smash[i]) + "\n" + 
			string(obj_input.smash_deadzone[i]) + "\n" + string(obj_input.c_stick_deadzone[i]) + "\n" +
			string (obj_input.l_stick_deadzone[i]) + "\n" + string(obj_input.l_stick_neutral[i]) + "\n"	
		}
		_str += "\n"
		//write into the replay buffer
		if (o.time = 0) {
			replay_buffer = buffer_create(10485760, buffer_grow, 1) //create a 10MB buffer
		} else {
			replay_buffer = buffer_create(o.time*131072*global.player_number, buffer_grow, 1) //create a buffer that is minutes*players/8 MB big
		}
		buffer_write(replay_buffer, buffer_string, _str) //write the data into the buffer
		
		pal_sprite = sprite_create_from_surface(pal_surface, 0, 0, 16, 16, false, false, 0, 0)
	}
} else {
	//go to the match room
	var _stage = argument[1] //TODO: add in match room selection
	if (room_exists(_stage)) { //if provided with a valid room
		room_goto(_stage) //go to that room
	} else { //otherwise
		show_message("Invalid Room Number,\ngoing to Ascent")
		room_goto(rm_match_Ascent) //go to the first match room
	}
	scr_update_network(4, _stage, obj_menu_char_select.stocks, obj_menu_char_select.time)
}

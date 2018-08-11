///@func scr_start_match(state)
///@param state - the type of match start false = change room; true = create players
///@desc starts a match by handing off data from the character select menu to the match handler

if (argument[0]) {
	var o = obj_menu_char_select
	var _inst = noone
	with (instance_create(0, 0, obj_match_handler)) { //create the match handler and pass variables through
		//write rules for replay file header
		replay_file = file_text_open_append(replay_file_string) //open the file
		file_text_write_real(replay_file, o.stocks); file_text_writeln(replay_file);
		file_text_write_real(replay_file, o.time); file_text_writeln(replay_file);
		file_text_write_real(replay_file, global.player_number); file_text_writeln(replay_file); //write player number
		//set the time
		if (o.time > 0) {
			alarm[0] = o.time*60*GAME_SPEED + GAME_SPEED*3 //set timer
		} else {
			alarm[0] = -1 //set timer to never activate	
		}
		replay_string[ceil(alarm[0])] = "" //give the replay string its size
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
			//write the players data to the file header
			file_text_writeln(replay_file) //go to next line
			file_text_write_real(replay_file, i); file_text_writeln(replay_file) //player number
			file_text_write_string(replay_file, string(player[i].name)); file_text_writeln(replay_file)//player profile name
			file_text_write_real(replay_file, string(player[i].character)); file_text_writeln(replay_file)//character
			file_text_write_string(replay_file, string(o.pallet[i])); file_text_writeln(replay_file)//pallet
			file_text_write_string(replay_file, string(player[i].player_col)); file_text_writeln(replay_file)//player colour
		
		}
		//write the end of the replay file header
		file_text_writeln(replay_file) //go to next line
		file_text_writeln(replay_file) //go to next line
		file_text_close(replay_file) //close the replay file
	}
} else {
	//go to the match room
	var _stage = asset_get_index("rm_match_" + string(get_integer("Select Stage:\n1 = Ascent\n2 = Outer Sanctum\n3 = Inner Sanctum", 1)))
	if (room_exists(_stage)) { //if provided with a valid room
		room_goto(_stage) //go to that room
	} else { //otherwise
		show_message("Invalid Room Number,\ngoing to Ascent")
		room_goto(rm_match_1) //go to the first match room
	}
}

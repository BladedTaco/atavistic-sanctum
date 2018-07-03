/// @description initialise the match handler


//input variables and control variables initialisation
for (var i = 0; i < 8; i++) {
	old_axis[i, 0] = 0
	input_array[i, 0] = 0
	state[i] = FREEFALL
	jumps[i] = 1
	player[i] = -1 //create the players here and populate the array with their instance ids
}
hitbox = false //draw hitboxes on true

randomise()



global.player_number = 8
for (var i = 0; i < 8; i++) {
	with(instance_create(100 + i*25, -200, obj_player)) {
		img_blend = c_white//make_colour_hsv(irandom(255), irandom(155) + 100, irandom(55) + 200)
		player_number = i
		other.player[i] = id
		character = choose(BAL, MAC, ETH, GEO)
		if (character = MAC) { max_jumps = 0 }
		controller = false
		sprite_index = scr_get_sprite(id, "hurt_down")
		shield_max_percentage = 30
		if (character = GEO) { shield_max_percentage = 50 }
		shield_percentage = shield_max_percentage
		
		//create pallet swap surface
		pal_surface = surface_create(16, 16) //colour pallet as a sprite
		surface_set_target(pal_surface)
		draw_clear_alpha(c_white, 1)
		pal_swap_draw_palette(global.pallet[character], 0, 0, 0) //draw base colours
		pal_swap_draw_palette(global.pallet[character], 1, 1, 0) //draw custom colours
		//*
		for (var o = 0; o < pal_swap_get_color_count(global.pallet[character]); o++) {
			draw_point_colour(1, o, make_colour_hsv(irandom(255), irandom(155) + 100, irandom(100) + 100))
		}
		//*/
		surface_reset_target()
	}
}

//get data from server for the match





/*
//create the replay file
replay_file = string(working_directory + "replays/" + date_datetime_string(date_current_datetime()) + ".txt") //get name of file based on time
if (file_exists(replay_file)) { //if a file already exists with this name
	var i = 0
	do {
		replay_file = string_insert("_", replay_file, string_length(replay_file)-4) //insert an underscore before ".txt"
		replay_file = string_insert(string(i), replay_file, string_length(replay_file)-4) //insert current test number after the underscore
		i++
	} until !file_exists(replay_file) //file name is free to use
}
replay_file = file_text_open_write(replay_file) //create replay file and store its index

//write the file header  
file_text_write_string(replay_file, string(global.game_version)) 
for (var i = 0; i < global.player_number; i++) {
	file_text_writeln(replay_file) //go to next line
	file_text_write_real(replay_file, i) //player number
	file_text_write_string(replay_file, string(data_array[i, 0])) //player name
	file_text_write_string(replay_file, string(data_array[i, 1])) //player profile name
	file_text_write_string(replay_file, string(data_array[i, 2])) //character
	file_text_write_string(replay_file, string(data_array[i, 3])) //custom colour string
	file_text_write_string(replay_file, string(data_array[i, 5])) //matchmaking rank
	file_text_write_string(replay_file, string(data_array[i, 7])) //team colour
}
file_text_writeln(replay_file) //go to next line
file_text_writeln(replay_file) //go to next line
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


var _inst = noone
global.player_number = 8
for (var i = 0; i < 8; i++) { 
	with (obj_spawn_point) { if (number = i) { _inst = id } } //get spawn point position
	with(instance_create(_inst.x, _inst.y, obj_player)) {
		image_alpha = 0
		img_blend = c_white
		player_col = make_colour_hsv((i/7)*255, 255, 150)
		player_number = i
		other.player[i] = id
		character = (i + 2) mod 4
		if (character = MAC) { max_jumps = 0 }
		controller = false
		sprite_index = scr_get_sprite(id, "hurt_down")
		shield_max_percentage = 30
		if (character = GEO) { shield_max_percentage = 50 }
		shield_percentage = shield_max_percentage
		spawning = true
		
		//create pallet swap surface
		pal_surface = surface_create(16, 16) //colour pallet as a sprite
		surface_set_target(pal_surface)
		draw_clear_alpha(c_white, 1)
		pal_swap_draw_palette(global.pallet[character], 0, 0, 0) //draw base colours
		pal_swap_draw_palette(global.pallet[character], 1, 1, 0) //draw custom colours
		//*
		draw_point_colour(1, 0, c_black)
		for (var o = 1; o < pal_swap_get_color_count(global.pallet[character]); o++) {
			draw_point_colour(1, o, make_colour_rgb(lerp(irandom(255), colour_get_red(surface_getpixel(pal_surface, 0, o)), 0.5),
													lerp(irandom(255), colour_get_green(surface_getpixel(pal_surface, 0, o)), 0.5),
													lerp(irandom(255), colour_get_blue(surface_getpixel(pal_surface, 0, o)), 0.5)))
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
/// @description POPULATE MENU
var _file = file_text_open_read("replays.txt")

var i = 0;
while (!file_text_eof(_file)) { //for the length of the file, read it into memory
	//read header information
	name[i] = file_text_read_string(_file); file_text_readln(_file)
	game_version[i] = file_text_read_string(_file); file_text_readln(_file)
	stage[i] = file_text_read_string(_file); file_text_readln(_file)
	stocks[i] = file_text_read_real(_file); file_text_readln(_file)
	time[i] = file_text_read_real(_file); file_text_readln(_file)
	player_number[i] = file_text_read_real(_file); file_text_readln(_file)
	file_text_readln(_file) //skip a line
	//read player information
	for (var o = 0; o < player_number[i]; o++) {
		if (o != file_text_read_real(_file)) { //if this player isn't the o'th player
			show_debug_message("CORRUPT FILE HEADER")	//show a debug message, and skip reading players
			file_text_readln(_file) //go to next line
			break;
		}
		file_text_readln(_file) //go to next line
		player_name[i, o] = file_text_read_string(_file); file_text_readln(_file)
		player_character[i, o] = file_text_read_real(_file); file_text_readln(_file)
		player_pallet[i, o] = file_text_read_real(_file); file_text_readln(_file)
		player_blend[i, o] = file_text_read_real(_file); file_text_readln(_file)
		file_text_readln(_file) //skip over the next empty line
	}
	file_text_readln(_file) //skip to start of next entry, or end of file
	i++
}

menu_length = i //set menu length to number of replayss (1-based)
if (menu_length = 0) { //no replays
	name[0] = "NO REPLAYS"
	game_version[0] = "VERSIONLESS"
	stage[0] = "STAGELESS"
	stocks[0] = 0
	time[0] = 0
	player_number[0] = 0
	player_name[0, 0] = "NAMELESS"
	player_character[0, 0] = BAL
	player_pallet[0, 0] = 0
	player_blend[0, 0] = 0
	menu_length = 1
}

//if there is a menu surface, free it so it is redrawn
if (surface_exists(menu_surface)) {
	surface_free(menu_surface)	
}
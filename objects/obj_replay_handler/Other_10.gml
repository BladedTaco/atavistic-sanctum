/// @description parse string

header_string = buffer_read(replay_buffer, buffer_string) //get string

header_string = scr_delete_line(header_string) //delete the first line of the string
match_room = asset_get_index("rm_match_" + scr_read_line(header_string)) //get room index
header_string = scr_delete_line(header_string)
stocks = real(scr_read_line(header_string)) //get stocks
header_string = scr_delete_line(header_string)
time = real(scr_read_line(header_string)) //get time
header_string = scr_delete_line(header_string)
player_number = real(scr_read_line(header_string)) //get player_number
header_string = scr_delete_line(header_string)
for (var i = 0; i < player_number; i++) { //for each player
	header_string = scr_delete_line(header_string)
	header_string = scr_delete_line(header_string) //read past player number
	player_name[i] = scr_read_line(header_string) //get the player's name
	header_string = scr_delete_line(header_string)
	player_character[i] = real(scr_read_line(header_string)) //get the player's character
	header_string = scr_delete_line(header_string)
	player_pallet[i] = real(scr_read_line(header_string)) //get the player's colour pallet
	header_string = scr_delete_line(header_string)
	player_col[i] = real(scr_read_line(header_string)) //get the player's colour blend
	header_string = scr_delete_line(header_string)
	var _spr = pal_bal
	switch (player_character[i]) {
		case BAL: _spr = pal_bal; break;
		case MAC: _spr = pal_mac; break;
		case GEO: _spr = pal_geo; break;
		case ETH: _spr = pal_eth; break;
	}
	pal_sprite[i] = _spr //set the pallet sprite
}
//read past the seperator
header_string = scr_delete_line(header_string)
header_string = scr_delete_line(header_string)
for (var i = 0; i < player_number; i++) {
	obj_input.smash_deadzone[i] = real(scr_read_line(header_string))
	scr_delete_line(header_string)
	obj_input.c_stick_deadzone[i] = real(scr_read_line(header_string))
	scr_delete_line(header_string)
	obj_input.l_stick_deadzone[i] = real(scr_read_line(header_string))
	scr_delete_line(header_string)
	obj_input.l_stick_neutral[i] = real(scr_read_line(header_string))
	scr_delete_line(header_string)
}
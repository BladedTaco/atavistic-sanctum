/// @description init variables and get stages
active = 0
cursor_x = GUI_WIDTH*0.5
cursor_y = GUI_HEIGHT*0.5

//get stage sprites
var i = 0
var _spr = -1;
while (i <= room_last) { //loop until broken, or until there are no more rooms to check for
	_spr = string_delete(room_get_name(rm_match_Ascent + i), 1, 9) //get name of room
	if (_spr = "d>") { //room name is <undefined>
		break; //break loop	
	}
	menu_option[i] = string_replace(_spr, "_", " ") //replace underscores with spaces for menu option
	_spr = asset_get_index("spr_stage_" + _spr) //get the sprite for the room preview
	if !(sprite_exists(_spr)) { //no stage preview exists
		_spr = spr_stage_missing //set it as the missing sprite
	}
	menu_sprite[i] = _spr //set the sprite to the array
	i++ //increment i
}
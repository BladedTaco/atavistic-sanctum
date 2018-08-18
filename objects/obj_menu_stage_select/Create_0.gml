/// @description 
active = 0
cursor_x = GUI_WIDTH*0.5
cursor_y = GUI_HEIGHT*0.5

//get stage sprites
var i = 0
var _spr = -1;
while (i <= room_last) { //loop until broken, or until there are no more rooms to check for
	_spr = string_delete(room_get_name(rm_match_Ascent + i), 1, 9)
	if (_spr = "d>") { //name is not <undefined>
		break; //break loop	
	}
	menu_option[i] = string_replace(_spr, "_", " ")
	_spr = asset_get_index("spr_stage_" + _spr)
	if !(sprite_exists(_spr)) { //no stage
		_spr = spr_stage_missing
		//break; //break loop
	}
	menu_sprite[i] = _spr
	i++
}
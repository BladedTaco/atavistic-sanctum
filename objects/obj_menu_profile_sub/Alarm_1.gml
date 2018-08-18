/// @description cursor alarm
if (string_pos("|", sub_name) = 0) {
	sub_name = string_replace(sub_name, "\b.\b", "|")	
} else {
	sub_name = string_replace(sub_name, "|", "\b.\b")
}
alarm[1] = MENU_DELAY*1.5
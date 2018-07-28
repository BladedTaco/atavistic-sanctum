/// @description 
if !(instance_exists(obj_menu_char_select) or instance_exists(obj_input) or instance_exists(obj_menu_main)) {
	macros()
	with (instance_create(0, 0, obj_menu_main)) {
		active = true	
	}
	instance_create(0, 0, obj_input)
}
instance_destroy();
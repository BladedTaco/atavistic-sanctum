/// @description Draw hitboxes and create hitboxes

//clear hitbox objects
scr_draw_hitboxes(global.show_hitboxes)	
if (global.debug) { show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number)) }
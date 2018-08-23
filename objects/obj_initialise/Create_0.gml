/// @description 
//7-7 animation end
//8-0 draw
//3-1 step begin
//

show_debug_message(ev_alarm)			//2
show_debug_message(ev_animation_end)	//7
show_debug_message(ev_create)			//0
show_debug_message(ev_destroy)			//1
show_debug_message(ev_draw)				//8
show_debug_message(ev_draw_end)			//73
show_debug_message(ev_gui)				//64
show_debug_message(ev_gui_end)			//75
show_debug_message(ev_other)			//7
show_debug_message(ev_step)				//3
show_debug_message(ev_step_begin)		//1
show_debug_message(ev_step_end)			//2
show_debug_message(ev_step_normal)		//0
show_debug_message(ev_trigger)			//11
if !(instance_exists(obj_menu_char_select) or instance_exists(obj_input) or instance_exists(obj_menu_main)) {
	macros()
	with (instance_create(0, 0, obj_menu_main)) {
		active = true	
	}
	instance_create(0, 0, obj_input)
	scr_reset_players()//reset players
}

instance_destroy();
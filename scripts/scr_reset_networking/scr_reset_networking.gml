///@func scr_reset_networking()
///@desc resets all networking objects and states
if (instance_exists(obj_server)) {
	instance_destroy(obj_server)
}	
if (instance_exists(obj_client)) {
	instance_destroy(obj_client)	
}
global.network_ip = "127.0.0.1"
global.network_state = NETWORK_JOIN



if (instance_exists(obj_server)) {
show_debug_message("SERVER IS: " + string(instance_exists(obj_server)))
}	
if (instance_exists(obj_client)) {
show_debug_message("CLIENT IS HERE")
}
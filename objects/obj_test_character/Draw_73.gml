/// @description 

if (character = "bal" and !instance_exists(obj_hitbox)) { //TODO move this to match handler
	scr_check_collision(RECTANGLE, 1 + irandom(100), 1 + irandom(100), 100 + irandom(300), 100 + irandom(300), irandom(90))
	scr_check_collision(RECTANGLE, 1 + irandom(100), 1 + irandom(100), 250, 250, irandom(90))

	/*
	surface_set_target(surf)
	draw_clear_alpha(c_white, 1)
	scr_draw_hitboxes(surf)	
	surface_reset_target()
	///*/
}
/// @description 
for (var i = 0; i <= 6; i++) {
	draw_text_normal(400, 200 + i * 50, string(global.coll[i]))	
}
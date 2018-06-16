/// @description Draw hitboxes and create hitboxes

//clear hitbox objects
with (obj_hitbox) {	instance_destroy() }
scr_draw_hitboxes(true)//hitbox)	
//*

draw_text_normal(200, 200, scr_get_state_name(state[0]))
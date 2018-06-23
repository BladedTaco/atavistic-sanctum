/// @description Draw hitboxes and create hitboxes

//clear hitbox objects
with (obj_hitbox) {	instance_destroy() }
scr_draw_hitboxes(true)//hitbox)	
//*

draw_set_halign(fa_center)
draw_text_normal(player[0].x, player[0].y - 100, scr_get_state_name(state[0]))
draw_text_normal(player[1].x, player[1].y - 100, scr_get_state_name(state[1]))
draw_set_halign(fa_left)
/// @description
if (!visible) { //creating self
	//move to somewhere on a hurtbox near the attacker's head, hopefully the attackers
	x = (attacker.bbox_left + attacker.bbox_right)/2
	y = (attacker.bbox_top*2 + attacker.bbox_bottom)/3
	var _inst = instance_nearest(x, y, obj_hitbox)
	x = _inst.x + random_range(-3, 3)
	y = _inst.y + random_range(-3, 3)
	visible = true ///make visible
} else if (floor(image_index = 3)) { //if frame 4
	image_index = 4 //skip to next frame
	//create a hitbox
	global.bbox[10] = creator
	scr_check_collision(RECTANGLE, 1, 1, attacker.x, attacker.y, 0, 1, 0, 0, 0, -1)
}
//move with creator
x += creator.momentum_x
y += creator.momentum_y
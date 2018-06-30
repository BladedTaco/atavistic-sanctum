/// @description 

var _d = image_angle
//move in direction
x += lengthdir_x(7, _d)
y += lengthdir_y(7, _d)

if (alarm[0] <= GAME_SPEED*2 - 3) {
	if (alarm[0] > 3) {
		global.bbox[10] = id
		scr_check_collision(CIRCLE, 5, 5, x, y, 0, 1, _d, 1, 0, -1) //create hitbox
		if (instance_place(x, y, obj_ground)) { alarm[0] = 3; image_index = 7 }
	} else {
		image_index = 7	
	}
}
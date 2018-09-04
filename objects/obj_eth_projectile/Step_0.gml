/// @description move and collide

var _d = image_angle
//move in direction
x += lengthdir_x(7, _d)
y += lengthdir_y(7, _d)

if (alarm[0] <= GAME_SPEED*2) { //if hitbox active
	//check for collision
	if (alarm[0] > 3) { //if active projectile
		global.bbox[10] = id
		scr_check_collision(CIRCLE, 5, 5, x, y, 0, 1, _d, 0.01, 0, 0.01) //create hitbox
		if (instance_place(x, y, obj_ground)) { alarm[0] = 3; image_index = 7 }
	} else { //inactive projectil, show explosion animation
		image_index = 7	
	}
}
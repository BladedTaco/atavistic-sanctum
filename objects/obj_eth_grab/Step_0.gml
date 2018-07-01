/// @description handle grab
if (instance_exists(creator)) {
	
	switch (state) {
		case 0: //grab
			global.bbox[10] = creator
			scr_check_collision(CIRCLE, 3, 3, x, y, 0, 4, HOLD, 1) //create hitbox
			var _l = point_distance(0, 0, obj_input.input_array[creator.player_number, XAXIS], obj_input.input_array[creator.player_number, YAXIS])
			var _d = point_direction(0, 0, obj_input.input_array[creator.player_number, XAXIS], obj_input.input_array[creator.player_number, YAXIS])
			_l *= 2.5
			_d += creator.image_angle
			x += lengthdir_x(_l, _d)
			y += lengthdir_y(_l, _d)
		break;
		
		case 1: //hold
			//move self and grabbed
			x = 30*creator.image_xscale
			y = -20
			var _d = degtorad(-creator.image_angle)
			attacker.x = x*cos(_d) - y*sin(_d) + creator.x
			attacker.y = x*sin(_d) + y*cos(_d) + creator.y
			x = attacker.x
			y = attacker.y
			if (obj_match_handler.state[creator.player_number] != HOLDING) {
				instance_destroy();	
			}
		break;
		
		case 2: //grab jab
			if (floor(image_index) = 4) { //attacks twice
				global.bbox[10] = creator
				scr_check_collision(RECTANGLE, 1, 1, attacker.x, attacker.y, 0, 2, 0, 0, 0, -1) //create hitbox
			}
		break;
		
		case 3: //throw
			x = attacker.x
			y = attacker.y
			if (obj_match_handler.state[creator.player_number] != HOLDING) {
				instance_destroy();	
			}
		break;
	}
}
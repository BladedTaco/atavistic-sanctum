///@func scr_draw_hitboxes(draw)
///@param draw - true to draw hitboxes, false to just create hitboxes
///@desc draws all hitboxes and hurtboxes to the screen and calls collision checks

if (argument[0]) { //draw and create hitboxes
	
	draw_set_alpha(0.5) //set draw alpha to 1/2
	//define variables
	var _x, _y, _maj, _min, i, o, _mat, _dir, _xy, _array, col_hurt, col_hit
	_mat = matrix_build_identity()
	col_hurt = c_lime
	col_hit = c_blue

	//decide between drawing hitboxes or hurtboxes 
	repeat (2) { //repeat for hitbox and hurtbox
		switch (draw_get_colour()) { //check draw colour
			case col_hurt: //hurtboxes last drawn
				draw_set_colour(col_hit) //set draw colour for hitboxes
				_array = global.hitbox
			break;
		
			default: //hitboxes last drawn, or first run through
				draw_set_colour(col_hurt) //set draw colour for hurtboxes
				_array = global.hurtbox
			break;
		}

		with (obj_player) { //for each character
			i = sprite_index //get arrays first entry
			if (sprite_exists(i)) { //if there is a sprite to draw hitboxes for
				o = floor(image_index)*100 //get arrays second entry
				while (_array[i, o] != NULL) { //for every hitbox
	
					//get parameters
					_maj = image_xscale*_array[i, o + 1]/2
					_min = image_yscale*_array[i, o + 2]/2
					_x = image_xscale*_array[i, o + 3] + x
					_y = image_yscale*_array[i, o + 4] + y
					_dir = sign(image_xscale)*_array[i, o + 5]
		
					//create the hurtbox
					if (_array = global.hitbox) {
						scr_check_collision(_array[i, o], _maj, _min, _x, _y, _dir, 
						_array[i, o + 6], _array[i, o + 7], _array[i, o + 8], 
						_array[i, o + 9], _array[i, o + 10]) //create the hitbox
					} else {
						scr_check_collision(_array[i, o], _maj, _min, _x, _y, _dir) //create the hurtbox
					}
				
					switch (_dir) { //rotate world matrix if needed
						case 0:	break; //do nothing for 0
				
						case DIR: //set _dir to image_angle
							_dir = image_angle
						default: //rotate world matrix by _dir on z-axis
							_mat = matrix_build(0, 0, 0, 0, 0, _dir, 1, 1, 1) //build rotated matrix
							matrix_set(matrix_world, _mat) //set the world matrix to the built one
							_dir = degtorad(_dir) //set _dir to its radian counterpart
							_xy = _x //used to replace _x as it gets changed too early
							_x = (_xy)*cos(_dir) - (_y)*sin(_dir) //translate x coordinate
							_y = (_xy)*sin(_dir) + (_y)*cos(_dir) //translate y coordinate
						break;		
					}
		
					switch (_array[i, o]) { //check hitbox shape and draw hitbox
						case CIRCLE: //draw hitbox as circle/ellipse
							draw_ellipse(_x - _maj, _y - _min, _x + _maj, _y + _min, false)
						break;
		
						case RECTANGLE: //draw hitbox as square/rectangle
							draw_rectangle(_x - _maj, _y - _min, _x + _maj, _y + _min, false)
						break;
					}
		
					if (_mat != matrix_build_identity()) { //if world matrix has been rotated
						_mat = matrix_build_identity() //build identity matrix
						matrix_set(matrix_world, _mat) //set the world matrix to identity
					}
					o += 11 //increment o to check for multiple hitboxes on a single frame
				}
				o = floor(image_index)*100 //reset o to redo loop for hitboxes
			}
		}
	}
	draw_set_alpha(1) //reset draw alpha

} else { //only create hitboxes without drawing 
	var _array = global.hitbox
	var i, o;
	repeat (2) { //repeat for hitbox and hurtbox
		switch (_array) { //check draw colour
			case global.hurtbox: //hurtboxes last drawn
				_array = global.hitbox
			break;
		
			default: //hitboxes last drawn, or first run through
				_array = global.hurtbox
			break;
		}
		with (obj_player) { //for each character
			i = sprite_index //get arrays first entry
			if (sprite_exists(i)) { //if there is a sprite to draw hitboxes for
				o = floor(image_index)*100 //get arrays second entry
				while (_array[i, o] != NULL) { //for every hitbox
					//create the hurtbox
					if (_array = global.hitbox) {
						scr_check_collision(_array[i, o], _array[i, o+1], _array[i, o+2], 
						_array[i, o+3], _array[i, o+4], _array[i, o+5], 
						_array[i, o + 6], _array[i, o + 7], _array[i, o + 8], 
						_array[i, o + 9], _array[i, o + 10]) //create the hitbox
					} else {
						scr_check_collision(_array[i, o], _array[i, o+1], _array[i, o+2], 
						_array[i, o+3], _array[i, o+4], _array[i, o+5]) //create the hurtbox
					}
					global.bbox[10] = id
					o += 11 //increment o to check for more hitboxes
				}
				o = floor(image_index)*100 //get arrays second entry
			}
		}
	}
}
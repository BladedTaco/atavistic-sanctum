///@func scr_draw_hitboxes()
///@desc draws all hitboxes and hurtboxes to the screen

draw_set_alpha(0.5) //set draw alpha to 1/2

//define variables
var _x, _y, _maj, _min, i, o, _mat, _dir, _xy, _array
_mat = matrix_build_identity()

with (obj_test_character) { //for each character (TODO change this when proper characters are in)
	i = sprite_index //get arrays first entry
	if (sprite_exists(i)) { //if there is a sprite to draw hitboxes for
		o = floor(image_index)*100 //get arrays second entry
		repeat (2) { //repeat for hitbox and hurtbox
				switch (draw_get_colour()) { //check draw colour
					case c_blue: //hurtboxes last drawn
						draw_set_colour(c_lime) //set draw colour for hitboxes
						_array = global.hitbox
					break;
		
					default: //hitboxes last drawn, or first run through
						draw_set_colour(c_blue) //set draw colour for hurtboxes
						_array = global.hurtbox
					break;
				}
	
			while (_array[i, o] != NULL) { //for every hitbox
	
				//get parameters
				_maj = image_xscale*_array[i, o + 1]/2
				_min = image_yscale*_array[i, o + 2]/2
				_x = image_xscale*_array[i, o + 3] + x
				_y = image_yscale*_array[i, o + 4] + y
				_dir = sign(image_xscale)*_array[i, o + 5]
		
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
				o += 10 //increment o to check for multiple hitboxes on a single frame
			}
			o = floor(image_index)*100 //reset o to redo loop for hitboxes
		}
	}
}
draw_set_alpha(1) //reset draw alpha
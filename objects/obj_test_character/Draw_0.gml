/// @description 
draw_set_font(fnt_pixel_large)


//redo and implement this shape rotation code into hitboxes, also draw all shapes of a similiar rotation together
if (character = "bal"){

if (alarm[1] > 0) {
	if (alarm[0] > 0) {
		_centre_x = 500
		_centre_y = 300
		_maj = 100
		_min = 25
		_angle = 45
	}
} else {
_centre_x = 200 + irandom(200)
_centre_y = 200 + irandom(200)	
_maj = 10 + irandom(200)
_min = 10 + irandom(200)
alarm[1] = room_speed*3
_angle = irandom(180) - 90
}
_angle += 5

var _len = 20

var _x = _centre_x
var _y = _centre_y

draw_set_colour(c_red)
draw_ellipse(_x - _maj, _y - _min, _x + _maj, _y + _min, true)

draw_set_colour(c_black)
draw_circle(_x, _y, 3, true)


var _mat = matrix_build(0, 0, 0, 0, 0, _angle, 1, 1, 1)
_angle = degtorad(_angle)
matrix_set(matrix_world, _mat)
draw_set_colour(c_blue)

_x = (_centre_x)*cos(_angle) - (_centre_y)*sin(_angle)
_y = (_centre_x)*sin(_angle) + (_centre_y)*cos(_angle)
draw_ellipse(_x - _maj, _y - _min, _x + _maj, _y + _min, true)
draw_set_colour(c_white)
draw_circle(_x, _y, 5, true)

_mat = matrix_build_identity()
matrix_set(matrix_world, _mat)

_angle = radtodeg(_angle)
}


if (character = "eth") {
	draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, 0, c_gray, 0.25)
	draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, 0, c_ltgray, 0.5)
}

if (sprite_exists(sprite_index)) {
	draw_self()
	draw_text_normal(x, 100, sprite_get_name(sprite_index))	
}


if(keyboard_check(ord("A"))) {
	var _y = (sprite_height/2)
	if (character = "eth") { _y -= sprite_height/5 }
	draw_sprite_ext(sprite_shield_ball, draw_count, x, y - _y, image_xscale, image_yscale, draw_count, c_white, 0.5)
}

draw_set_colour(c_red)

if (character = "bal") {
	var j = 0
	do {
		var i = sprite_index
		var o = floor(image_index)*100 + j*10
		switch (global.hurtbox[i, o]) {			
			case CIRCLE:
				draw_ellipse(	image_xscale*(global.hurtbox[i, o + 3] - (global.hurtbox[i, o + 1]/2)) + x,
								scale*(global.hurtbox[i, o + 4] - (global.hurtbox[i, o + 2]/2)) + y,
								image_xscale*(global.hurtbox[i, o + 3] + (global.hurtbox[i, o + 1]/2)) + x,
								scale*(global.hurtbox[i, o + 4] + (global.hurtbox[i, o + 2]/2)) + y,
								false)
			break;
		
			case RECTANGLE:
				draw_rectangle(	image_xscale*(global.hurtbox[i, o + 3] - (global.hurtbox[i, o + 1]/2)) + x,
								scale*(global.hurtbox[i, o + 4] - (global.hurtbox[i, o + 2]/2)) + y,
								image_xscale*(global.hurtbox[i, o + 3] + (global.hurtbox[i, o + 1]/2)) + x,
								scale*(global.hurtbox[i, o + 4] + (global.hurtbox[i, o + 2]/2)) + y,
								false)
			break;
		}
		j++
	} until(global.hurtbox[i, o + 10] = NULL)
	
	var j = 0
	do {
		var i = sprite_index
		var o = floor(image_index)*100 + j*10
		switch (global.hitbox[i, o]) {			
			case CIRCLE:
				draw_ellipse(	image_xscale*(global.hitbox[i, o + 3] - (global.hitbox[i, o + 1]/2)) + x,
								scale*(global.hitbox[i, o + 4] - (global.hitbox[i, o + 2]/2)) + y,
								image_xscale*(global.hitbox[i, o + 3] + (global.hitbox[i, o + 1]/2)) + x,
								scale*(global.hitbox[i, o + 4] + (global.hitbox[i, o + 2]/2)) + y,
								false)
			break;
		
			case RECTANGLE:
				draw_rectangle(	image_xscale*(global.hitbox[i, o + 3] - (global.hitbox[i, o + 1]/2)) + x,
								scale*(global.hitbox[i, o + 4] - (global.hitbox[i, o + 2]/2)) + y,
								image_xscale*(global.hitbox[i, o + 3] + (global.hitbox[i, o + 1]/2)) + x,
								scale*(global.hitbox[i, o + 4] + (global.hitbox[i, o + 2]/2)) + y,
								false)
			break;
		}
		j++
	} until(global.hitbox[i, o + 10] = NULL)
}

draw_set_colour(c_white)
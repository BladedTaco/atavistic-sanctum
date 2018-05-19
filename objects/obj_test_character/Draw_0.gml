/// @description 
draw_set_font(fnt_pixel_large)



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
				draw_ellipse(global.hurtbox[i, o + 3] - (global.hurtbox[i, o + 1]/2) + x,
							global.hurtbox[i, o + 4] - (global.hurtbox[i, o + 2]/2) + y,
							global.hurtbox[i, o + 3] + (global.hurtbox[i, o + 1]/2) + x,
							global.hurtbox[i, o + 4] + (global.hurtbox[i, o + 2]/2) + y,
							false)
			break;
		
			case RECTANGLE:
				draw_rectangle(global.hurtbox[i, o + 3] - (global.hurtbox[i, o + 1]/2) + x,
							global.hurtbox[i, o + 4] - (global.hurtbox[i, o + 2]/2) + y,
							global.hurtbox[i, o + 3] + (global.hurtbox[i, o + 1]/2) + x,
							global.hurtbox[i, o + 4] + (global.hurtbox[i, o + 2]/2) + y,
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
				draw_ellipse(global.hitbox[i, o + 3] - (global.hitbox[i, o + 1]/2) + x,
							global.hitbox[i, o + 4] - (global.hitbox[i, o + 2]/2) + y,
							global.hitbox[i, o + 3] + (global.hitbox[i, o + 1]/2) + x,
							global.hitbox[i, o + 4] + (global.hitbox[i, o + 2]/2) + y,
							false)
			break;
		
			case RECTANGLE:
				draw_rectangle(global.hitbox[i, o + 3] - (global.hitbox[i, o + 1]/2) + x,
							global.hitbox[i, o + 4] - (global.hitbox[i, o + 2]/2) + y,
							global.hitbox[i, o + 3] + (global.hitbox[i, o + 1]/2) + x,
							global.hitbox[i, o + 4] + (global.hitbox[i, o + 2]/2) + y,
							false)
			break;
		}
		j++
	} until(global.hitbox[i, o + 10] = NULL)
}

draw_set_colour(c_white)
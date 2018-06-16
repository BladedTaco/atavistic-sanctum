/// @description 
var _height = (sprite_height)/2
var _width = (sprite_width)/2
hitbox = scr_check_collision_test(RECTANGLE, _width, _height, x - 1, y - 1, -image_angle) //create hitbox
var _xx = -(-_height + GROUND_HEIGHT)*sin(-degtorad(image_angle)) + x - 1
var _yy = (-_height + GROUND_HEIGHT)*cos(-degtorad(image_angle)) + y - 1
hurtbox = scr_check_collision_test(RECTANGLE, _width, GROUND_HEIGHT, _xx, _yy, -image_angle) //create top hitbox
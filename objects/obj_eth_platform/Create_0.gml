/// @description 
image_angle = global.eth_angle
var _height = (sprite_height)/2
var _width = (sprite_width)/2
var _xx = -(-_height + GROUND_HEIGHT)*sin(-degtorad(image_angle)) + x - 1
var _yy = (-_height + GROUND_HEIGHT)*cos(-degtorad(image_angle)) + y - 1
hurtbox = scr_check_collision_test(RECTANGLE, _width, GROUND_HEIGHT, _xx, _yy, -image_angle) //create top hitbox
hitbox = hurtbox //make hitbox equal to hurtbox to avoid any crashes from treating this as a ground object
creator = noone
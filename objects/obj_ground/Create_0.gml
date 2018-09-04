/// @description define variables and create hitboxes
var _height = (sprite_height)/2
var _width = (sprite_width)/2
hitbox = scr_check_collision_test(RECTANGLE, _width, _height, x - 1, y - 1, -image_angle) //create hitbox
var _xx = -(-_height + GROUND_HEIGHT)*sin(-degtorad(image_angle)) + x - 1
var _yy = (-_height + GROUND_HEIGHT)*cos(-degtorad(image_angle)) + y - 1
hurtbox = scr_check_collision_test(RECTANGLE, _width, GROUND_HEIGHT, _xx, _yy, -image_angle) //create top hitbox

//get the angles of the diagonals before image angle rotation
diag1 = point_direction(0, 0, _width, -_height)  + image_angle//centre to top right
diag2 = point_direction(0, 0, -_width, -_height) + image_angle//centre to top left
diag3 = point_direction(0, 0, -_width, _height)  + image_angle//centre to botom left
diag4 = point_direction(0, 0, _width, _height)   + image_angle//centre to bottom right

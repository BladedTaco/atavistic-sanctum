///@func scr_raycast(start_pos_array, end_pos || dir, collider, precise, not_me, max_dis*)
///@param start_pos_array - the [x, y] position of the start of the ray
///@param end_pos||dir - either the end position [x, y] or the direction of the ray
///@param collider - the object type to collide with
///@param precise - if the collision is precise, should be yes
///@param not_me - if the calling instance is exempt from the ray
///@param max_dis* - optional, the max distance of the ray
///@desc casts the given ray to find the end position of it. ds_map returned, destroy it after.

//create the return map
var map = ds_map_create();
ds_map_add(map, "start_position", argument[0]); //Where the ray started
ds_map_add(map, "hit_position", []); //Where the ray hit something
ds_map_add(map, "collider", noone); //What object the ray hit (or noone if no object is hit)
ds_map_add(map, "direction", 0); //The direction of the ray from start to hit (in degrees)
ds_map_add(map, "reflection_angle", 0); //The angle of reflection (in degrees)
ds_map_add(map, "normal", 0); //The normal of the face hit (in degrees)
ds_map_add(map, "distance", 0); //The distance from start to end.

//declare variables
var current_dis = 0;
var start_pos = argument[0]
var max_dis = 500; //DEFAULT VALUE for max ray distance.
var ray_dir;
var collider = argument[2]
var precise = argument[3]
var not_me = argument[4]

//get ray properties
if (is_array(argument[1])) { //end position given
	var end_pos = argument[1]
	ray_dir = point_direction(start_pos[0], start_pos[1], end_pos[0], end_pos[1])
	max_dis = point_distance(start_pos[0], start_pos[1], end_pos[0], end_pos[1])
} else { //projected direction given
	ray_dir = argument[1]
	if (argument_count = 6) { //max distance specified
		max_dis = argument[5] //apply given
	}
}

//check if there is no collisions
if (collision_line(
	start_pos[0],
	start_pos[1], 
	start_pos[0] + lengthdir_x(max_dis, ray_dir),
	start_pos[1] + lengthdir_y(max_dis, ray_dir),
	collider,
	precise,
	not_me 
	) = noone) {
	//no collisions found, exit script, return false
	return false //return no collision		
}

//check for no collisions up to last 12.5% of travel
repeat(3) { //iteratively check
	if (collision_line(
		start_pos[0],
		start_pos[1], 
		start_pos[0] + lengthdir_x(max_dis*0.5, ray_dir),
		start_pos[1] + lengthdir_y(max_dis*0.5, ray_dir),
		collider,
		precise,
		not_me 
		) = noone and max_dis > 1) {
		//no collisions found in first 50% of travel, move start point
		start_pos[0] +=	lengthdir_x(max_dis*0.5, ray_dir)
		start_pos[1] += lengthdir_y(max_dis*0.5, ray_dir)
		max_dis *= 0.5
	}
}

//move forward until the colliding object is found.
var hit = false;
var current_x, current_y, hit_object;
while (current_dis < max_dis and hit = false) {
	current_dis += 1; //DEFAULT VALUE how far to move to test for collision.
	current_x = start_pos[0] + lengthdir_x(current_dis, ray_dir);
	current_y = start_pos[1] + lengthdir_y(current_dis, ray_dir);
	hit_object = collision_point(current_x, current_y, collider, precise, not_me)
	if (hit_object != noone) { //colliding object found, do ray.
		ds_map_replace(map, "hit_pos", [current_x, current_y]);
		ds_map_replace(map, "object", hit_object);
		
		/* NOT NEEDED SINCE CORNER POSITIONS ARE WORKED OUT PRIOR
		var rad_angle = degtorad(hit_object.image_angle) //get angle in radians
		
		//get position of collider from its perspective
		var _x = hit_object.x - ((hit_object.sprite_xoffset * cos(rad_angle)) + (hit_object.sprite_yoffset * sin(rad_angle)));
		var _y = hit_object.y + ((hit_object.sprite_xoffset * sin(rad_angle)) - (hit_object.sprite_yoffset * cos(rad_angle)));
			
		//get the centre position of the collider
		var center_x = _x + ((hit_object.sprite_width * .5 * cos(rad_angle)) + (hit_object.sprite_height * .5 * sin(rad_angle)));
		var center_y = _y - ((hit_object.sprite_width * .5 * sin(rad_angle)) - (hit_object.sprite_height * .5 * cos(rad_angle)));

		//get angle and distance
		var dir = radtodeg(arctan2(hit_object.sprite_height * .5, hit_object.sprite_width * .5));
		var dis = sqrt(sqr(hit_object.sprite_width * .5) + sqr(hit_object.sprite_height * .5));
		*/
		
		//get corner positions
		var corners = [
			collider.hitbox._x[0],
			collider.hitbox._y[0],
			collider.hitbox._x[1],
			collider.hitbox._y[1],
			collider.hitbox._x[2],
			collider.hitbox._y[2],
			collider.hitbox._x[3],
			collider.hitbox._y[3]
		]
		
		//get distance to each line
		var distance_to_lines = []
		distance_to_lines = [
			abs((corners[3] - corners[7]) * current_x - (corners[2] - corners[6]) * current_y + (corners[2] * corners[7]) - (corners[3] * corners[6])) / (sqrt(sqr(corners[3] - corners[7]) + sqr(corners[2] - corners[6]))),
			abs((corners[7] - corners[5]) * current_x - (corners[6] - corners[4]) * current_y + (corners[6] * corners[5]) - (corners[7] * corners[4])) / (sqrt(sqr(corners[7] - corners[5]) + sqr(corners[6] - corners[4]))),
			abs((corners[1] - corners[5]) * current_x - (corners[0] - corners[4]) * current_y + (corners[0] * corners[5]) - (corners[1] * corners[4])) / (sqrt(sqr(corners[1] - corners[5]) + sqr(corners[0] - corners[4]))),
			abs((corners[1] - corners[3]) * current_x - (corners[0] - corners[2]) * current_y + (corners[0] * corners[3]) - (corners[1] * corners[2])) / (sqrt(sqr(corners[1] - corners[3]) + sqr(corners[0] - corners[2])))
		]
		
		//find the closest line
		var lowest = 0;
		for (var i = array_length_1d(distance_to_lines); i > -1; i--) {
			if (distance_to_lines[i] < distance_to_lines[lowest]) {
				lowest = i	
			}
		}
		
		//get the normal position
		var normal_x = lowest % 2 == 0 ? lowest - 1 : 0;
		var normal_y = lowest % 2 == 1 ? lowest - 2 : 0;
		
		//get the normal
		var normal = radtodeg(arctan2(normal_y, normal_x)) + hit_object.image_angle;
		
		//update the return map
		ds_map_replace(map, "reflection_angle", normal - (ray_dir - normal) + 180);
		ds_map_replace(map, "normal", normal);
		ds_map_replace(map, "dis", point_distance(start_pos[0], start_pos[1], current_x, current_y));
		
		//return the map
		return map
	}
}
return false //collision dropped at some point
/// @description init variables
shape = global.bbox[0]
_maj = global.bbox[1]
_min = global.bbox[2]
_dir = global.bbox[3]
_dir = degtorad(_dir)
creator = global.bbox[10]
if (global.bbox[4]) { //hitbox
	hitbox = true
	d = global.bbox[5] //damage
	a = global.bbox[6] //direction of knocbkac
	b = global.bbox[7] //base knocback
	s = global.bbox[8] //scaling knocback
	h = global.bbox[9] //hitstun multiplier
} else { //hurtbox
	hitbox = false
}

col = false
//set these as the rectangle bounding box relative to position, but first have it as the unrotated rectangle
bb[0] = -_maj
bb[1] = -_min
bb[2] = _maj
bb[3] = _min
//points of corners of a rectangle
_x[0] = bb[0]*cos(_dir) - bb[1]*sin(_dir)
_y[0] = bb[0]*sin(_dir) + bb[1]*cos(_dir)
_x[1] = bb[2]*cos(_dir) - bb[1]*sin(_dir)
_y[1] = bb[2]*sin(_dir) + bb[1]*cos(_dir)
_x[2] = bb[2]*cos(_dir) - bb[3]*sin(_dir) 
_y[2] = bb[2]*sin(_dir) + bb[3]*cos(_dir) 
_x[3] = bb[0]*cos(_dir) - bb[3]*sin(_dir)
_y[3] = bb[0]*sin(_dir) + bb[3]*cos(_dir)
		
for (var i = 0; i <= 3; i++) {
	_x[i] += x //make it the absolute position
	_y[i] += y //make it the absolute position
}
bb[0] = x
bb[1] = y
bb[2] = x
bb[3] = y
//get bbox
for (var i = 0; i <= 3; i++) {
	if (bb[0] > _x[i]) { bb[0] = _x[i] }
	if (bb[1] > _y[i]) { bb[1] = _y[i] }
	if (bb[2] < _x[i]) { bb[2] = _x[i] }
	if (bb[3] < _y[i]) { bb[3] = _y[i] }
}

//get the points inside of the rectnagle based on side of each line
for (var i = 0; i < 4; i++) {
	side[i] = sign((x - _x[i])*(_y[(i+1) mod 4] - _y[i]) - (y - _y[i])*(_x[(i+1) mod 4] - _x[i]))	
}
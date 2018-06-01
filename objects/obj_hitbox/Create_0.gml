/// @description 
alarm[0] = 3
_maj = global.bbox_maj
_min = global.bbox_min
_dir = global.bbox_dir
shape = global.bbox_shape
_dir = degtorad(_dir)
//set these as the rectangle bounding box relative to position, but first have it as the unrotated rectangle
bb[0] = -_maj/2
bb[1] = -_min/2
bb[2] = _maj/2
bb[3] = _min/2
//points of corners of a rectangle
col = 0
_x[0] = 0
_x[1] = 0
_x[2] = 0
_x[3] = 0
_y[0] = 0
_y[1] = 0
_y[2] = 0
_y[3] = 0

_x[0] = bb[0]*cos(_dir) - bb[1]*sin(_dir)
_y[0] = bb[0]*sin(_dir) + bb[1]*cos(_dir)
_x[1] = bb[2]*cos(_dir) - bb[1]*sin(_dir)
_y[1] = bb[2]*sin(_dir) + bb[1]*cos(_dir)
_x[2] = bb[2]*cos(_dir) - bb[3]*sin(_dir) 
_y[2] = bb[2]*sin(_dir) + bb[3]*cos(_dir) 
_x[3] = bb[0]*cos(_dir) - bb[3]*sin(_dir)
_y[3] = bb[0]*sin(_dir) + bb[3]*cos(_dir)
		

if (instance_number(obj_hitbox) = 1) {
	creator = false	
} else {
	creator = true	
}

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

saved = false

colled = false
save = 0
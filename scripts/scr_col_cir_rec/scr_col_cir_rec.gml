

var _id = argument[0]
var _id2 = argument[1]

if (_id.shape != CIRCLE) {
	_id = argument[1]
	_id2 = argument[0]
}

//_id is the ellipse and _id2 rectangle

//check if the centre of the ellipse is in the rectangle
if (scr_point_in_rec(_id.x, _id.y, _id2)) { return 2 } //return 1 on true


//check if the rotated bounding boxes are colliding else return 0
if (!scr_rec_col_rec(_id, _id2)) { return 0 } //return no collision if not true


//check if any vertex is inside the ellipse
var _xx, _yy
for (var i = 0; i <= 3; i++) { 
	_xx = _id2._x[i]
	_yy = _id2._y[i]
	if (scr_point_in_cir(_xx, _yy, _id)) { return 3 }
}

//check if all vertexes are in the same quadrant
var _q = 0
for (var i = 0; i <= 3; i++) {
	if (_id.x*cos(_id2._dir) + _id.y*sin(_id2._dir) > _id2._x[i]*cos(_id2._dir) + _id2._y[i]*sin(_id2._dir)) { //left of ellipse
		if (_id.x*sin(_id2._dir) - _id.y*cos(_id2._dir) > _id2._x[i]*sin(_id2._dir) - _id2._y[i]*cos(_id2._dir)) { //above ellipse
			//Q2	2
			if (_q != 2) and (_q != 0) {
				return 4
			}
			_q = 2
		} else { //below ellipse
			//Q3
			if (_q != 3) and (_q != 0) {
				return 4
			}
			_q = 3
		}
	} else {
		if (_id.x*sin(_id2._dir) - _id.y*cos(_id2._dir) > _id2._x[i]*sin(_id2._dir) - _id2._y[i]*cos(_id2._dir)) { //above ellipse
			//Q1	
			if (_q != 1) and (_q != 0) {
				return 4
			}
			_q = 1
		} else { //below ellipse
			//Q4	
			if (_q != 4) and (_q != 0) {
				return 4
			}
			_q = 4
		}	
	}
}



//check if any endpoint of the ellipse is in the rectangle
for (var i = 0; i <= 3; i++) {
	_xx = (_id._x[i] + _id._x[(i + 1) mod 4])/2
	_yy = (_id._y[i] + _id._y[(i + 1) mod 4])/2
	if (scr_point_in_rec(_xx, _yy, _id2)) { return 5 }
}

return 6 //no collision found

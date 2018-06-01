///@func scr_rec_col_rec(_id, _id2)
///@param _id - one of the two rectangle hitbox objects
///@param _id2 - one of the two rectangle hitbox objects
///@desc returns true if the rectangles intersect
var a = argument[0]
var b = argument[1]

//check if the vector projections from each edges normal to each vertice overlaps
var j, _mina, _maxa, _minb, _maxb, _normx, _normy, _proj
repeat(2) {
	for (var i = 0; i <= 3; i++) { //for edge in polygon a
		//get the normal
		_normx = a._y[(i+1) mod 4] - a._y[i]
		_normy = a._x[i] - a._x[(i+1) mod 4]
		
		_mina = "/"
		_maxa = "/"
		for (var o = 0; o <= 3; o++) { //for each vertex in polygon a
			//get the range of the projection
			_proj = _normx * a._x[o] + _normy * a._y[o]
			if ((_mina = "/") or (_proj < _mina)) {
				_mina = _proj
			}
			if ((_maxa = "/") or (_proj > _maxa)) {
				_maxa = _proj
			}
		}
		
		_minb = "/"
		_maxb = "/"
		for (var o = 0; o <= 3; o++) { //for each vertex in polygon b
			//get the range of the projection
			_proj = _normx * b._x[o] + _normy * b._y[o]
			if ((_minb = "/") or (_proj < _minb)) {
				_minb = _proj
			}
			if ((_maxb = "/") or (_proj > _maxb)) {
				_maxb = _proj
			}
		}
		//if the projection ranges overlap
		if ((_maxa < _minb) or (_maxb < _mina)) { return false } //not colliding
	}
	//switch a and b
	j = a
	a = b
	b = j
}

return true; //colliding
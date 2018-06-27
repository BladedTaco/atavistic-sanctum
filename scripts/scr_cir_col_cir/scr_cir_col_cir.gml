///@func scr_cir_col_cir(_id, _id2)
///@param _id - one of the two cirle hitbox objects
///@param _id2 - one of the two circle hitbox objects
///@desc returns true if the ellipses intersect
var _id = argument[0]
var _id2 = argument[1]

//check if either centre of either ellipse is inside the other one
if (scr_point_in_cir(_id.x, _id.y, _id2)) {
	return true	
} else if (scr_point_in_cir(_id2.x, _id2.y, _id)) {
	return true	
}

// get the variables to pass into the collision script
var wx0 = ((_id._x[1] + _id._x[2])/2)	- _id.x
var wy0 = ((_id._y[1] + _id._y[2])/2)  	- _id.y
var wx1 = ((_id2._x[1] + _id2._x[2])/2) - _id2.x
var wy1 = ((_id2._y[1] + _id2._y[2])/2) - _id2.y

var hw0 = _id._min/_id._maj
var hw1 = _id2._min/_id2._maj

//return the collision scripts result
return scr_cir_col_cir_collide(_id.x, _id.y, wx0, wy0, hw0, _id2.x, _id2.y, wx1, wy1, hw1) //return true or false

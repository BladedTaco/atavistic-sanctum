///@func instance_create(x, y, obj)
///@param x - the x position to create the object
///@param y - the y position to create the object
///@param obj - the object index of the object to create
///@desc a passthrough script to create an object at 0 depth

return instance_create_depth(argument[0], argument[1], 0, argument[2]) //call the passthrough
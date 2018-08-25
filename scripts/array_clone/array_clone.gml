///@func array_clone(array)
///@param array - the array to clone
///@desc returns a clone of the input array
var array = argument[0];
var first = array[0]; array[0] = first;
return array;
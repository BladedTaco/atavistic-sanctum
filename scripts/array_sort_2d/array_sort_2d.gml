///@func array_sort_2d(array, order, column)
///@param array - the array to be sorted
///@param order - the direction of sorting (0 1) (ascending descending)
///@param column - the column to sort the array by
///@desc returns the 2d array sorted by its first column with the given sorting order
var _array = argument[0]

if (argument[1] = 0) { //sorting order is descending
	for (var i = 0; i < array_height_2d(_array); i++) {
		_array[i, argument[2]] *= -1 //make every value negative so that the array is sorted descending	
	}
}

//define variables
var o = array_height_2d(_array) - 2
var v, j


//BUBBLE SORT
do { //loop through
	for (var i=0; i<= o; i++) { //for each entry of the array that isnt sorted
		if (_array[i, argument[2]] < _array[i+1, argument[2]]) { //if this element is smaller than the next
			for (v=0; v<array_length_2d(_array, i); v++) { //for the length of the array
				j = _array[i, v] //store element value
				if (v < array_length_2d(_array, i+1)) {
					_array[i, v] = _array[i+1, v] //move the next elements value to the previous's
				} else {
					_array[i, v] = ""
				}
				_array[i+1, v] = j //set the next elements value to the original value of the first's
			}
		}
	}
	o-- //reduce number of entries to check as the largest element is sorted to the end
} until (o <= -1) //repeat sorting until the entire array is sorted


if (argument[1] = 0) { //sorting order is descenging
	for (var i = 0; i < array_height_2d(_array); i++) { //for each element in the array
		_array[i, argument[2]] *= -1 //make every value what it was originally now that the array is sorted	
	}
}

return _array
///@func array_sort_1d(array, order)
///@param array - the array to be sorted
///@param order - the direction of sorting (0 1) (ascending descending)
///@desc returns the 1d array sorted by its first column with the given sorting order
var _array = argument[0]

if (argument[1] = 0) { //sorting order is descending
	for (var i = 0; i < array_length_1d(_array); i++) {
		_array[i] *= -1 //make every value negative so that the array is sorted descending	
	}
}


var o = array_length_1d(_array) - 2
var j

//BUBBLE SORT
do { //loop through
	for (var i=0; i<= o; i++) { //for each entry of the array that isnt sorted
		if (_array[i] < _array[i+1]) { //if this element is smaller than the next
			j = _array[i] //store element value
			_array[i] = _array[i+1] //move the next elements value to the previous's
			_array[i+1] = j //set the next elements value to the original value of the first's
		}
	}
	o-- //reduce number of entries to check as the largest element is sorted to the end
} until (o <= -1) //repeat sorting until the entire array is sorted


if (argument[1] = 0) { //sorting order is descenging
	for (var i = 0; i < array_length_1d(_array); i++) { //for each element in the array
		_array[i] *= -1 //make every value what it was originally now that the array is sorted	
	}
}

return _array
/// @description handle state
if (state = 0) { //state of grab
	instance_destroy(); //destroy self
}
if (state = 2) { //state of grab jab
	//set to grab hold
	state = 1
	sprite_index = spr_eth_grab_hold
}
if (state = 1) { //grab hold
	//make able to throw
	can_throw = true	
}
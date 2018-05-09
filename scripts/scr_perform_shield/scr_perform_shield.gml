///@func scr_perform_shield(object, player_number, GEO)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param GEO - if the character is GEO or another moving shield character (booleanic)
///@desc causes the given character to perform a shield

if (argument[0].character = GEO) { //moving shield
	with (instance_create(argument[0].x, argument[0].y, obj_shield)) { //with the shield object
		sprite_index = scr_get_sprite(argument[0], "shield_ball") //give it its sprite
		creator = argument[0] //give it its assigned character
	}
} else { //stationary shield
	argument[0].image_index = 0 //set character to first animation frame
	argument[0].sprite_index = scr_get_sprite(argument[0], "shield") //set character to shield animation
	with (instance_create(argument[0].x, argument[0].y, obj_shield)) { //with a shield object
		sprite_index = scr_get_sprite(argument[0], "shield_ball") //get the sprite
		creator = argument[0] //get the assigned object to protecc
	}	
}
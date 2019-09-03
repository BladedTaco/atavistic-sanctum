
//save array to file
var _data = ds_map_create()
var _temp = ds_list_create()
_temp[| 0] = global.hitbox
_temp[| 1] = global.hurtbox
_data[? "hitbox"] = ds_list_write(_temp)
ds_map_secure_save(_data, "hitbox")
ds_map_destroy(_data)
ds_list_destroy(_temp)


game_end();


///@func scr_delete_line(string)
///@param string - the input string
///@desc returns the string with the first line deleted

return string_delete(argument[0], 1, string_pos("\n", argument[0]))
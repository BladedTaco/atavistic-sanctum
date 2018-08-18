///@func scr_read_line(string)
///@param string - the input string
///@desc returns the first line of the given string

return string_copy(argument[0], 1, string_pos("\n", argument[0])-1)
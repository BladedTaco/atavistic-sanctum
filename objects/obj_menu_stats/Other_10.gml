/// @description repopulate sub menu

//clear current stats
for (var i = 0; i < CHARACTER_NUMBER*2; i++) {
	sub_menu_option[i] = 0
}

//read new stats
i = 0
var _file = "names/stats/" + menu_option[menu_index] + ".txt"
if (file_exists(_file)) {
	_file = file_text_open_read(_file)
	while (!file_text_eof(_file)) {
		sub_menu_option[i] = string(file_text_read_real(_file))
		file_text_readln(_file)
		i++
	}
	file_text_close(_file)
}
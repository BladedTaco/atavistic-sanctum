/// @description 
name = "NAMELESS" //name
player = -1 //active player number
player_number = 1 //total player number
active = 0 //state of activity
alarm[0] = 10
menu_option[0] = "NEW NAME"
menu_index = 0
menu_direction = 0
clip_surface = -1 //a surface used to make sure drawn elements dont overflow boundaries

randomise();

for (var i = 0; i < 99; i++) {
	menu_option[i] = chr(irandom(25) + 65)
	do {
		menu_option[i] += chr(irandom(25) + 65)
	} until (irandom(4) = 2)
}

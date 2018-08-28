/// @description 
draw_set_colour(c_teal)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_rectangle(-1, -1, GUI_WIDTH*0.3, GUI_HEIGHT, false) //draw backdrop 

//draw selector behind current menu index
draw_set_colour(c_fuchsia)
var i = menu_index;
if (i > 1) {
	if (i > 3) {
		if (i > 9) {
			if (i > 11) {
				i--
			}
			i--
		}
		i--
	}
	i--
}
switch (menu_index) {
	case 12: case 10: //bottom right
		draw_rectangle(GUI_WIDTH*0.19, GUI_HEIGHT*0.1*(i + 0.9), GUI_WIDTH*0.29, GUI_HEIGHT*0.1*(i + 1.6), false)
	break;
	case 4: case 2: //top right
		draw_rectangle(GUI_WIDTH*0.215, GUI_HEIGHT*0.1*(i + 0.9), GUI_WIDTH*0.29, GUI_HEIGHT*0.1*(i + 1.6), false)
	break;
	case 11: case 9: //bottom left
		draw_rectangle(GUI_WIDTH*0.01, GUI_HEIGHT*0.1*(i + 0.9), GUI_WIDTH*0.19, GUI_HEIGHT*0.1*(i + 1.6), false)	
	break;
	case 3: case 1: //top left
		draw_rectangle(GUI_WIDTH*0.01, GUI_HEIGHT*0.1*(i + 0.9), GUI_WIDTH*0.215, GUI_HEIGHT*0.1*(i + 1.6), false)	
	break;
	default: //other
		draw_rectangle(GUI_WIDTH*0.01, GUI_HEIGHT*0.1*(i + 0.9), GUI_WIDTH*0.29, GUI_HEIGHT*0.1*(i + 1.6), false)	
	break;
}
draw_set_colour(c_ltgray)

//draw background rectangles and sprites
draw_rectangle(GUI_WIDTH*0.025, GUI_HEIGHT*0.2, GUI_WIDTH*0.2, GUI_HEIGHT*0.25, false)
draw_rectangle(GUI_WIDTH*0.225, GUI_HEIGHT*0.2, GUI_WIDTH*0.275, GUI_HEIGHT*0.25, false)
draw_sprite_ext(menu_sprite[0], 0, GUI_WIDTH*0.25 - 1, GUI_HEIGHT*0.25 + 1, 2, 2, 0, c_white, 1)
draw_rectangle(GUI_WIDTH*0.025, GUI_HEIGHT*0.3, GUI_WIDTH*0.2, GUI_HEIGHT*0.35, false)
draw_rectangle(GUI_WIDTH*0.225, GUI_HEIGHT*0.3, GUI_WIDTH*0.275, GUI_HEIGHT*0.35, false)
draw_sprite_ext(menu_sprite[1], 0, GUI_WIDTH*0.25 - 1, GUI_HEIGHT*0.35 + 1, 2, 2, 0, c_white, 1)
draw_rectangle(GUI_WIDTH*0.025, GUI_HEIGHT*0.7, GUI_WIDTH*0.275, GUI_HEIGHT*0.75, false)
draw_rectangle(GUI_WIDTH*0.025, GUI_HEIGHT*0.8, GUI_WIDTH*0.175, GUI_HEIGHT*0.85, false)
draw_rectangle(GUI_WIDTH*0.2, GUI_HEIGHT*0.8, GUI_WIDTH*0.275, GUI_HEIGHT*0.85, false)
draw_rectangle(GUI_WIDTH*0.025, GUI_HEIGHT*0.9, GUI_WIDTH*0.175, GUI_HEIGHT*0.95, false)
draw_rectangle(GUI_WIDTH*0.2, GUI_HEIGHT*0.9, GUI_WIDTH*0.275, GUI_HEIGHT*0.95, false)

//draw sliders
draw_healthbar(GUI_WIDTH*0.025, GUI_HEIGHT*0.1, GUI_WIDTH*0.275, GUI_HEIGHT*0.15, percentage/10, c_black, c_white, $0000aa, 0, true, true)
draw_healthbar(GUI_WIDTH*0.025, GUI_HEIGHT*0.4, GUI_WIDTH*0.275, GUI_HEIGHT*0.45, (global.player_number - 2)/0.06, c_black, c_white, $0000aa, 0, true, true)
draw_healthbar(GUI_WIDTH*0.025, GUI_HEIGHT*0.5, GUI_WIDTH*0.275, GUI_HEIGHT*0.55, room_speed/2.4, c_black, c_white, $0000aa, 0, true, true)
draw_healthbar(GUI_WIDTH*0.025, GUI_HEIGHT*0.6, GUI_WIDTH*0.275, GUI_HEIGHT*0.65, global.input_buffer_length/0.5, c_black, c_white, $0000aa, 0, true, true)

//draw title
draw_set_font(fnt_pixel_4)
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.045, c_black, c_white, "TRAINING MENU", 4)
draw_set_font(fnt_pixel_2)

//draw text
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.125 - 1, c_black, c_white,		menu_option[0], 2) //"PERCENTAGE - 0%"
draw_text_outlined(GUI_WIDTH*0.1125, GUI_HEIGHT*0.225 - 1, c_black, c_white,	menu_option[1], 2) //"NAME: P1"
draw_text_outlined(GUI_WIDTH*0.1125, GUI_HEIGHT*0.325 - 1, c_black, c_white,	menu_option[2], 2) //"ACTION: IDLE"
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.425 - 1, c_black, c_white,		menu_option[3], 2) //"CPU NO. - 1"
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.525 - 1, c_black, c_white,		menu_option[4], 2) //"GAME SPEED. - 1x"
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.625 - 1, c_black, c_white,		menu_option[5], 2) //"INPUT LAG. - 6 FRAME"
draw_text_outlined(GUI_WIDTH*0.15, GUI_HEIGHT*0.725 - 1, c_black, c_white,		menu_option[6], 2) //"STAGE: TRAINING GROUNDS"
draw_text_outlined(GUI_WIDTH*0.1, GUI_HEIGHT*0.825 - 1, c_black, c_white,		menu_option[7], 2) //"HITBOXES: OFF"
draw_text_outlined(GUI_WIDTH*0.2375, GUI_HEIGHT*0.825 - 1, c_black, c_white,	menu_option[8], 2) //"UI: ON"
draw_text_outlined(GUI_WIDTH*0.10125, GUI_HEIGHT*0.925 - 1, c_black, c_white,	menu_option[9], 2) //"DEFAULT SETTINGS"
draw_text_outlined(GUI_WIDTH*0.2375, GUI_HEIGHT*0.925 - 1, c_black, c_white,	menu_option[10], 2) //"EXIT"

//draw tiny text
draw_set_font(fnt_pixel)
draw_text_normal(GUI_WIDTH*0.25, GUI_HEIGHT*0.3 + 1, "CPU")
draw_text_normal(GUI_WIDTH*0.25, GUI_HEIGHT*0.2 + 1, "PLAYER")


/* things this menu needs to handle
 - percentage				- slider
 - profile name				- dropdown
 - character				- dropdown
 
 - enemy character			- dropdown
 - no of cpus				- slider
 - CPU action				- dropdown
 
 - game speed				- slider
 - input lag				- slider
 - stage					- dropdown
 
 - hitbox visibility		- toggle
 - ui visibility			- toggle

 - default settings			- button
 - exit						- button

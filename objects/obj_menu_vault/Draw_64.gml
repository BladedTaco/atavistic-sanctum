/// @description draw menu
//set variables and draw options
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_colour($5f3f00)
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false) //draw background
for (var i = 0; i < array_length_1d(menu_option); i++) { //for each menu option
	_yy = y + 70 + 80*i //get its y position to draw
	if (i = menu_index) { //if currently selected
		_xx = x - 80*_percent*(old_menu_index != menu_index) //pop x position out
		//draw the menu option text and sprite
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, c_white, 1)
		draw_text_outlined(_xx + 130, _yy + 40, c_black, c_white, menu_option[i], 4)
	} else if (i = old_menu_index) { //if last menu option to be selected
		//retract menu sprite and text back to level with others
		_xx = x + (80*_percent - 80)*(old_menu_index != menu_index)
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, c_gray, 1)
		draw_text_outlined(_xx + 130, _yy + 40, c_dkgray, c_ltgray, menu_option[i], 4)
	} else { //normal menu option
		//draw a normal menu option sprite and text
		_xx = x
		draw_sprite_ext(spr_menu_item, 0, _xx, _yy, 2, 2, 0, c_white, 1)
		draw_text_outlined(_xx + 50, _yy + 40, c_black, c_white, menu_option[i], 4)
	}
}

_yy = y
_xx = x
if (old_menu_index != menu_index) { //if chaning menu index
	if (_percent > 0.5) { //if not yet half done
		//draw old menu sprite retracting
		draw_sprite_ext(menu_sprite[old_menu_index], 0, _xx + GUI_WIDTH*(0.75 + (1 - _percent)/2), _yy + GUI_HEIGHT/2, 2, 2, _percent*180 - 180, c_white,  2*(_percent - 0.5))	
	} else { //more than or equal to half done
		//draw new menu sprite coming into screen
		draw_sprite_ext(menu_sprite[menu_index], 0, _xx + GUI_WIDTH*(0.75 + _percent/2), _yy + GUI_HEIGHT/2, 2, 2, _percent*180, c_white,  2*(0.5 - _percent))	
	}
} else { //not chaning menu index
	//draw current menu sprite
	draw_sprite_ext(menu_sprite[menu_index], 0, _xx + GUI_WIDTH*0.75, _yy + GUI_HEIGHT/2, 2, 2, 0, c_white, 1)	
}
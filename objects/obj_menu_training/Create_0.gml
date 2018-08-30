/// @description 

menu_option[0] = "PERCENTAGE - 0%"			//slider
menu_option[1] = "NAME: P1"					//dropdown
menu_option[2] = "ACTION: IDLE"				//dropdown
menu_option[3] = "CPU NO. - 1"				//slider
menu_option[4] = "GAME SPEED. - 1x"			//slider
menu_option[5] = "INPUT LAG. - 6 FRAME"		//slider
menu_option[6] = "STAGE: Training Grounds"	//dropdown
menu_option[7] = "HITBOXES: OFF"			//button
menu_option[8] = "UI: ON"					//button
menu_option[9] = "RESET MODIFIERS"			//button
menu_option[10] = "EXIT"					//button

menu_sprite[0] = spr_bal_stock //player character
menu_sprite[1] = spr_bal_stock //enemy character

percentage = 0; //percentage value
cpu_action = "IDLE" //action for cpus
cpu_index = [0, 0, 0, 0, 0, 0, 0] //an index for the loop of cpu moves

menu_index = 0;
menu_length = 13;
sub_menu = false

visible = false
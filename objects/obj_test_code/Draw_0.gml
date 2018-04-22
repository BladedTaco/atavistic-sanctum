/// @description 
var j = 20

draw_text_normal(100, j, string(gp_face1		- 32769)); j += 20 //0		face button
draw_text_normal(100, j, string(gp_face2		- 32769)); j += 20 //1		face button
draw_text_normal(100, j, string(gp_face3		- 32769)); j += 20 //2		face button
draw_text_normal(100, j, string(gp_face4		- 32769)); j += 20 //3		face button --------
draw_text_normal(100, j, string(gp_shoulderl	- 32769)); j += 20 //4		shoulder button
draw_text_normal(100, j, string(gp_shoulderr	- 32769)); j += 20 //5		shoulder button ---------
draw_text_normal(100, j, string(gp_shoulderlb	- 32769)); j += 20 //6		trigger
draw_text_normal(100, j, string(gp_shoulderrb	- 32769)); j += 20 //7		trigger --------
draw_text_normal(100, j, string(gp_select		- 32769)); j += 20 //8		menu button 
draw_text_normal(100, j, string(gp_start		- 32769)); j += 20 //9		menu button  --------
draw_text_normal(100, j, string(gp_stickl		- 32769)); j += 20 //10		stick button 
draw_text_normal(100, j, string(gp_stickr		- 32769)); j += 20 //11		stick button --------
draw_text_normal(100, j, string(gp_padu			- 32769)); j += 20 //12		D-Pad
draw_text_normal(100, j, string(gp_padd			- 32769)); j += 20 //13		D-Pad
draw_text_normal(100, j, string(gp_padl			- 32769)); j += 20 //14		D-Pad
draw_text_normal(100, j, string(gp_padr			- 32769)); j += 20 //15		D-Pad ----------
draw_text_normal(100, j, string(gp_axislh		- 32769)); j += 20 //16		stick value
draw_text_normal(100, j, string(gp_axislv		- 32769)); j += 20 //17		stick value
draw_text_normal(100, j, string(gp_axisrh		- 32769)); j += 20 //18		stick value
draw_text_normal(100, j, string(gp_axisrv		- 32769)); j += 20 //19		stick value ------

//6, 7 are triggers
//16 + are sticks


//gp_face1		Top button 1 (this maps to the "A" on an Xbox 360 controller and the cross on a PS controller)
//gp_face2		Top button 2 (this maps to the "B" on an Xbox 360 controller and the circle on a PS controller)
//gp_face3		Top button 3 (this maps to the "X" on an Xbox 360 controller and the square on a PS controller)
//gp_face4		Top button 4 (this maps to the "Y" on an Xbox 360 controller and the triangle on a PS controller)
//gp_shoulderl	Left shoulder button
//gp_shoulderlb	Left shoulder trigger
//gp_shoulderr	Right shoulder button
//gp_shoulderrb	Right shoulder trigger
//gp_select		The select button (this is the PS button on a DS4 controller)
//gp_start		The start button (this is the "options" button on a PS4 controller)
//gp_stickl		The left stick pressed (as a button)
//gp_stickr		The right stick pressed (as a button)
//gp_padu			D-pad up
//gp_padd			D-pad down
//gp_padl			D-pad left
//gp_padr			D-pad right
//gp_axislh		Left stick horizontal axis (analogue)
//gp_axislv		Left stick vertical axis (analogue)
//gp_axisrh		Right stick horizontal axis (analogue)
//gp_axisrv
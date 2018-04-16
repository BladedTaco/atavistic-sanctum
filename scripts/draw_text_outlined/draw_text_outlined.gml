///@desc draw_text_outlined(x, y, outline_colour, string_colour, string)  
///@param x - the x position to draw the text
///@param y - the y position to draw the text
///@param outline_colour - the colour of the outline
///@param string_colour - the colour of the string
///@param string - the string to draw

var xx,yy;									// define local variables
xx = argument[0];  							// set xx to be the x argument
yy = argument[1];  							// set yy to be the y argument
											
//Outline  									
draw_set_color(argument[2]);  				// set the colour to draw the outline
draw_text(xx+1, yy+1, argument[4]);  		// draw the string 8 times, aligned to the adjacent pixels to the given position
draw_text(xx-1, yy-1, argument[4]);  		// this creates the outline
draw_text(xx,   yy+1, argument[4]);  		
draw_text(xx+1,   yy, argument[4]);  		
draw_text(xx,   yy-1, argument[4]);  		
draw_text(xx-1,   yy, argument[4]);  		
draw_text(xx-1, yy+1, argument[4]);  		
draw_text(xx+1, yy-1, argument[4]);  		
											
//Text  									
draw_set_color(argument[3]);  				// set the colour to draw the string
draw_text(xx, yy, argument[4]);  			// draw the string
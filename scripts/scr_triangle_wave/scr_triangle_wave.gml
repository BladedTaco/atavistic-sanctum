///@func scr_triangle_wave(amplitude, period, x_shift, y_shift, x)
///@param amplitude - the amplitude of the wave (1/2 range of values)
///@param period - the period of the wave (one cycle)
///@param x_shift - the translation in the x axis
///@param y_shift - the translation in the y axis
///@param x - the x value to check
///@desc returns the y value of a triangle wave with the given x position and paramaters
//general formula y = (4a/p) * abs(mod(x - h - (p/2), p) - (p/2)) + k
return (4*argument[0]/argument[1]) * abs(((argument[4] - argument[2] - (argument[1]/4) + (argument[1]*1000)) mod (argument[1])) - (argument[1]/2)) + argument[3]
//return the y value
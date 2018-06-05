///@func collide(x0, y0, wx0, wy0, hw0, x1, y1, wx1, wy1, hw1) 
///@param x0 - the x coordinate of the first ellipse
///@param y0 - the y coordinate of the first ellipse
///@param wx0 - the relative x distance to the major-axis endpoint of the first ellipse
///@param wy0 - the relative y distance to the major-axis endpoint of the first ellipse
///@param hw0 - the ratio of the non-given axis / given axis of the first ellipse
///@param x1 - the x coordinate of the second ellipse
///@param y1 - the y coordinate of the second ellipse
///@param wx1 - the relative x distance to the major-axis endpoint of the second ellipse
///@param wy1 - the relative y distance to the major-axis endpoint of the second ellipse
///@param hw1 - the ratio of the non-given axis / given axis of the second ellipse
///@desc iteratively checks for a collision of two given ellipses
//this is a function translated from C++ code, as such it breaks many conventions used throughout the program
 
// Test for collision between two ellipses, "0" and "1". Ellipse is at (x, y) with major or minor radius 
// vector (wx, wy) and the other major or minor radius perpendicular to that vector and hw times as long.
var x0 = argument[0] 
var y0 = argument[1]
var wx0= argument[2] 
var wy0= argument[3] 
var hw0= argument[4] 
var x1 = argument[5]
var y1 = argument[6]
var wx1= argument[7]
var wy1= argument[8] 
var hw1= argument[9]    
var rr = hw1*hw1*(wx1*wx1 + wy1*wy1)*(wx1*wx1 + wy1*wy1)*(wx1*wx1 + wy1*wy1);
var xx = hw1*wx1*(wy1*(y1 - y0) + wx1*(x1 - x0)) - wy1*(wx1*(y1 - y0) - wy1*(x1 - x0));
var yy = hw1*wy1*(wy1*(y1 - y0) + wx1*(x1 - x0)) + wx1*(wx1*(y1 - y0) - wy1*(x1 - x0));
var temp = wx0;
wx0 = hw1*wx1*(wy1*wy0 + wx1*wx0) - wy1*(wx1*wy0 - wy1*wx0);
var temp2 = wy0;
wy0 = hw1*wy1*(wy1*wy0 + wx1*temp) + wx1*(wx1*wy0 - wy1*temp);
var hx0 = hw1*wx1*(wy1*(temp*hw0)-wx1*temp2*hw0)-wy1*(wx1*(temp*hw0)+wy1*temp2*hw0);
var hy0 = hw1*wy1*(wy1*(temp*hw0)-wx1*temp2*hw0)+wx1*(wx1*(temp*hw0)+wy1*temp2*hw0);

if (wx0*yy - wy0*xx < 0) {
	xx = -xx;
	yy = -yy;
}
            
if ((wx0 - xx)*(wx0 - xx) + (wy0 - yy)*(wy0 - yy) <= rr) {
	return true;
} else if ((wx0 + xx)*(wx0 + xx) + (wy0 + yy)*(wy0 + yy) <= rr) {
	return true;
} else if ((hx0 - xx)*(hx0 - xx) + (hy0 - yy)*(hy0 - yy) <= rr) {
	return true;
} else if ((hx0 + xx)*(hx0 + xx) + (hy0 + yy)*(hy0 + yy) <= rr) {
	return true;
} else if (xx*(hy0 - wy0) + yy*(wx0 - hx0) <= hy0*wx0 - hx0*wy0 &&
       yy*(wx0 + hx0) - xx*(wy0 + hy0) <= hy0*wx0 - hx0*wy0) {
	return true;
} else if (xx*(wx0-hx0) - yy*(hy0-wy0) > hx0*(wx0-hx0) - hy0*(hy0-wy0)     
       && xx*(wx0-hx0) - yy*(hy0-wy0) < wx0*(wx0-hx0) - wy0*(hy0-wy0)
       && (xx*(hy0-wy0) + yy*(wx0-hx0) - hy0*wx0 + hx0*wy0)*(xx*(hy0-wy0) + yy*(wx0-hx0) - hy0*wx0 + hx0*wy0)
       <= rr*((wx0-hx0)*(wx0-hx0) + (wy0-hy0)*(wy0-hy0))) {
	return true;
} else if (xx*(wx0+hx0) + yy*(wy0+hy0) > -wx0*(wx0+hx0) - wy0*(wy0+hy0)
       && xx*(wx0+hx0) + yy*(wy0+hy0) < hx0*(wx0+hx0) + hy0*(wy0+hy0)
       && (yy*(wx0+hx0) - xx*(wy0+hy0) - hy0*wx0 + hx0*wy0)*(yy*(wx0+hx0) - xx*(wy0+hy0) - hy0*wx0 + hx0*wy0)
       <= rr*((wx0+hx0)*(wx0+hx0) + (wy0+hy0)*(wy0+hy0))) {
	return true;
} else {
	if ((hx0-wx0 - xx)*(hx0-wx0 - xx) + (hy0-wy0 - yy)*(hy0-wy0 - yy) <= rr) {
		return scr_cir_col_cir_iterate(xx, yy, hx0, hy0, -wx0, -wy0, rr);
	} else if ((hx0+wx0 - xx)*(hx0+wx0 - xx) + (hy0+wy0 - yy)*(hy0+wy0 - yy) <= rr) {
		return scr_cir_col_cir_iterate(xx, yy, wx0, wy0, hx0, hy0, rr);
	} else if ((wx0-hx0 - xx)*(wx0-hx0 - xx) + (wy0-hy0 - yy)*(wy0-hy0 - yy) <= rr) {
		return scr_cir_col_cir_iterate(xx, yy, -hx0, -hy0, wx0, wy0, rr);
	} else if ((-wx0-hx0 - xx)*(-wx0-hx0 - xx) + (-wy0-hy0 - yy)*(-wy0-hy0 - yy) <= rr) {
		return scr_cir_col_cir_iterate(xx, yy, -wx0, -wy0, -hx0, -hy0, rr);
	} else if (wx0*yy - wy0*xx < wx0*hy0 - wy0*hx0 && abs(hx0*yy - hy0*xx) < hy0*wx0 - hx0*wy0) {
		if (hx0*yy - hy0*xx > 0) {
			return scr_cir_col_cir_iterate(xx, yy, hx0, hy0, -wx0, -wy0, rr);
		}
		return scr_cir_col_cir_iterate(xx, yy, wx0, wy0, hx0, hy0, rr);
	} else if (wx0*xx + wy0*yy > wx0*(hx0-wx0) + wy0*(hy0-wy0) && wx0*xx + wy0*yy < wx0*(hx0+wx0) + wy0*(hy0+wy0)
		 && (wx0*yy - wy0*xx - hy0*wx0 + hx0*wy0)*(wx0*yy - wy0*xx - hy0*wx0 + hx0*wy0) < rr*(wx0*wx0 + wy0*wy0)) {
		if (wx0*xx + wy0*yy > wx0*hx0 + wy0*hy0) {
			return scr_cir_col_cir_iterate(xx, yy, wx0, wy0, hx0, hy0, rr);
		}
		return scr_cir_col_cir_iterate(xx, yy, hx0, hy0, -wx0, -wy0, rr);
	} else {
		if (hx0*yy - hy0*xx < 0) {
			xx = -xx;
			yy = -yy;
		}  
		if (hx0*xx + hy0*yy > -hx0*(wx0+hx0) - hy0*(wy0+hy0) && hx0*xx + hy0*yy < hx0*(hx0-wx0) + hy0*(hy0-wy0)
		    && (hx0*yy - hy0*xx - hy0*wx0 + hx0*wy0)*(hx0*yy - hy0*xx - hy0*wx0 + hx0*wy0) < rr*(hx0*hx0 + hy0*hy0)) {
			if (hx0*xx + hy0*yy > -hx0*wx0 - hy0*wy0) {      
				return scr_cir_col_cir_iterate(xx, yy, hx0, hy0, -wx0, -wy0, rr);
			} 
			return scr_cir_col_cir_iterate(xx, yy, -wx0, -wy0, -hx0, -hy0, rr);
		}
		return false;
	}
}
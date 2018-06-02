/// @description 
if (save < 3) and (save > 0) {
	screen_save(working_directory + "Screens/" + string(global.num++) + ".png")
	save++
}
/// @description initialise variables
for (var i = 0; i < 8; i++) {
	cursor_x[i] = -1
	cursor_y[i] = -1
	character[i] = -1
	pallet[i] = -1
	sprite[i] = spr_bal_stock
	name[i] = "PLAYER " + string(i)
}

stocks = 3
time = "5:00"
player_number = 1
active = false
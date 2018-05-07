///@func scr_control_character()
///@desc controls the characters based on movements and states

var i = 0 //initialise the loop counter to 0
var _check_state, _move_character; //initialise some local variables in memory
do {
	_check_state = true //set base state of variable
	_move_character = true //set base state of variable
	if (input_array[i, PAUSE]) { //pause or unpause
		global.paused = !global.paused	
	}
	
	i++
}  until(i = global.player_number)




/*
ControlCharacter()
	Begin
		i <--- 0
		_smash_attack <--- false
		_check_state <--- true
		Do
			_move_character <--- true
			if pause_key[i]
				paused <--- not paused
			End if
			
			if Absolute(Absolute(old_xaxis[i]) - Absolute(xaxis[i]) + Absolute(Absolute(old_yaxis[i]) - Absolute(yaxis[i])) > 0.2
				_smash_attack <--- true
			End if
			
			if freefall[i] is equal to false
				if jump_key[i]
					if jumps[i] > 0
						PerformJump(i)
					End if
				End if
			
				if state[i] is not equal to "Ledge"
					if special_key[i]
						PerformSpecial(i, point_direction(0, 0, xaxis[i], yaxis[i]))
						_check_state <--- false
						_move_character <--- false
					End if
			
					if grab_key[i]
						PerformGrab(i, sign(xaxis[i]))
						_check_state <--- false
						_move_character <--- false
					End if
				End if
			End if
			
			If _check_state
				Switch state[i]
					Case "Airborne":
						if attack_key[i]
							PerformAerialAttack(i, point_direction(0, 0, xaxis[i], yaxis[i]))
						End if
					
						if shield_key[i]
							if _smash_attack
								PerformAerialDodge(i, point_direction(0, 0, xaxis[i], yaxis[i]))
								_move_character <--- false
							Else
								PerformAerialDodge(i, -10)
								_move_character <--- false
							End if
						End if				
					End Case
				
					Case "Grounded":
						if attack_key[i]
							if _smash_attack
								PerformAttack(i, point_direction(0, 0, xaxis[i], yaxis[i]))
								_move_character <--- false
							Else
								PerformTiltAttack(i, point_direction(0, 0, xaxis[i], yaxis[i]))
								_move_character <--- false
							End if
						End if
						
						if shield_key[i]
							if _smash_attack
								PerformDodge(i, point_direction(0, 0, xaxis[i], yaxis[i]))
								_move_character <--- false
							Else
								PerformShield(i)
								_move_character <--- false
							End if
						End if
					End Case
					
					Case "Ledge":
						_move_character <--- false
						if attack_key[i] or special_key[i]
							PerformLedgeAttack(i)
						Else if shield_key[i] 
							PerformLedgeRoll(i)
						Else if grab_key[i]
							PerformLedgeGrab(i)
						End if
					break;
				
				End Switch
			End If
			If _move_character
				MoveCharacter(i, point_distance(0, 0, xaxis[i], yaxis[i]), point_direction(0, 0, xaxis[i], yaxis[i]))
			End if
			i <--- i + 1
		Until i is equal to player_number
	End
	
Notes on ControlCharacter()
	There are several functions called in this subroutine, these functions are minor functions
		therefore, they have no written pseudocode for them, rather they only have a description
		of their purpose as listed in the Minor Functions section.
	_move_character, _smash_attack and _check_state are local variables


///@func scr_get_state_name(state)
///@param state - the state number to get the string of
///@desc returns the given state as its string given its number
//this is one long ternary operator chain, basically a bunch of nested if else statements
return (  (argument[0] == GROUNDED		 ? "GROUNDED"		
		: (argument[0] == SPEED_UP		 ? "SPEED_UP" 
		: (argument[0] == WALKING		 ? "WALKING" 
		: (argument[0] == DASHING		 ? "DASHING" 
		: (argument[0] == RUNNING		 ? "RUNNING" 
		: (argument[0] == JUMPING		 ? "JUMPING" 
		: (argument[0] == AIRBORNE		 ? "AIRBORNE" 
		: (argument[0] == FREEFALL		 ? "FREEFALL" 
		: (argument[0] == TILT_ATTACK	 ? "TILT_ATTACK" 
		: (argument[0] == SMASH_ATTACK	 ? "SMASH_ATTACK" 
		: (argument[0] == SPECIAL_ATTACK ? "SPECIAL_ATTACK" 
		: (argument[0] == LEDGE			 ? "LEDGE" 
		: (argument[0] == LEDGE_ALT		 ? "LEDGE_ALT" 
		: (argument[0] == LANDING		 ? "LANDING" 
		: (argument[0] == DODGING		 ? "DODGING"
		: (argument[0] == AIR_DODGING	 ? "AIR_DODGING"
		: (argument[0] == SHIELDING		 ? "SHIELDING"
		: (argument[0] == HIT_STUN		 ? "HIT_STUN"
		: (argument[0] == TECHING		 ? "TECHING"
		: (argument[0] == JUMP_RISE		 ? "JUMP_RISE"
		: (argument[0] == AIR_ATTACK	 ? "AIR_ATTACK"
		: (argument[0] == GRABBING		 ? "GRABBING"
		: (argument[0] == HOLDING		 ? "HOLDING"
		: (argument[0] == SPEED_DOWN	 ? "SPEED_DOWN"
		: (argument[0] == DASH_SLOW		 ? "DASH_SLOW"
		: (argument[0] == UNSHIELDING	 ? "UNSHIELDING" 
		: (argument[0] == CROUCHING		 ? "CROUCHING" 
		: (argument[0] == HELPLESS		 ? "HELPLESS"
		: "UNKNOWN STATE")))))))))))))))))))))))))))))
/// @description Draw hitboxes and create hitboxes
scr_draw_hitboxes(hitbox)	
//*
var _str = ""
switch (state[0]) {
	case GROUNDED		: _str = "GROUNDED"			break;
	case SPEED_UP		: _str = "SPEED_UP"			break;
	case WALKING 		: _str = "WALKING"			break;
	case DASHING 		: _str = "DASHING"			break;
	case RUNNING 		: _str = "RUNNING"			break;
	case JUMPING 		: _str = "JUMPING"			break;
	case AIRBORNE 		: _str = "AIRBORNE" 		break;
	case FREEFALL 		: _str = "FREEFALL" 		break;
	case TILT_ATTACK 	: _str = "TILT_ATTACK"		break;
	case SMASH_ATTACK 	: _str = "SMASH_ATTACK" 	break;
	case SPECIAL_ATTACK	: _str = "SPECIAL_ATTACK"	break;
	case LEDGE 			: _str = "LEDGE" 			break;
	case LEDGE_ALT		: _str = "LEDGE_ALT"		break;
	case LANDING 		: _str = "LANDING" 			break;
	case DODGING 		: _str = "DODGING" 			break;
	case AIR_DODGING 	: _str = "AIR_DODGING" 		break;
	case SHIELDING 		: _str = "SHIELDING" 		break;
	case HIT_STUN 		: _str = "HIT_STUN" 		break;
	case TECHING 		: _str = "TECHING" 			break;
	case JUMP_RISE 		: _str = "JUMP_RISE" 		break;
	case AIR_ATTACK		: _str = "AIR_ATTACK"		break;
	case GRABBING		: _str = "GRABBING"			break;
	case HOLDING		: _str = "HOLDING"			break;
	case DASH_SLOW		: _str = "DASH_SLOW"		break;
	case SPEED_DOWN		: _str = "SPEED_DOWN"		break;
	case UNSHIELDING	: _str = "UNSHIELDING"		break;
}
draw_text_normal(200, 200, _str)
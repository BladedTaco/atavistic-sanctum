///@func scr_initialise_controller_inputs()
///@desc Initialises the controller inputs

for (var i = 0; i < 8; i++) {
	trigger_threshold[i] = 0			//trigger threshold for triggers
										//constants			GameCube		PSX				XBOX/GENERIC	
	button_array[i, 0]  = ATTACK		//gp_face1			A				Cross			A					
	button_array[i, 1]  = SPECIAL		//gp_face2			B				Circle			B			
	button_array[i, 2]  = JUMP			//gp_face3			X				Square			X			
	button_array[i, 3]  = JUMP			//gp_face4			Y				Triangle		Y				
	button_array[i, 4]  = GRAB			//gp_shoulderl		-				L1				L1					
	button_array[i, 5]  = GRAB			//gp_shoulderr		Z				L2				L2					
	button_array[i, 6]  = PAUSE			//gp_select			-				PS				SELECT					
	button_array[i, 7]  = PAUSE			//gp_start			START			OPTIONS			START				
	button_array[i, 8]  = LEFT_STICK	//gp_stickl			-				L3				L3					
	button_array[i, 9]  = RIGHT_STICK	//gp_stickr			-				R3				R3					
	button_array[i, 10] = TAUNT			//gp_padu			D-Pad UP		D-Pad UP		D-Pad UP			
	button_array[i, 11] = TAUNT			//gp_padd			D-Pad DOWN		D-Pad DOWN		D-Pad DOWN			
	button_array[i, 12] = TAUNT			//gp_padl			D-Pad LEFT		D-Pad LEFT		D-Pad LEFT			
	button_array[i, 13] = TAUNT			//gp_padr			D-Pad RIGHT		D-Pad RIGHT		D-Pad RIGHT			
	button_array[i, 14] = SHIELD		//gp_shoulderrb		RIGHT TRIGGER	RIGHT TRIGGER	RIGHT TRIGGER		
	button_array[i, 15] = SHIELD		//gp_shoulderlb		LEFT TRIGGER	LEFT TRIGGER	LEFT TRIGGER		
	button_array[i, 16] = XAXIS			//gp_axislh			L STICK Hori	L STICK Hori	L STICK Hori		
	button_array[i, 17] = YAXIS			//gp_axislv			L STICK Vert	L STICK Vert	L STICK Vert		
	button_array[i, 18] = ALT_XAXIS		//gp_axisrh			C STICK Hori	R STICK Hori	R STICK Hori		
	button_array[i, 19] = ALT_YAXIS		//gp_axisrv			C STICK Vert	R STICK Vert	R STICK Vert		
}
																//PSX				XBOX/GENRIC		GAMECUBE		ALSO GAMECUBE SOMEHOW
button_const_array[0]  = gp_face1		//buttons start			//Cross				A				//X				L stick Vert			
button_const_array[1]  = gp_face2								//Circle			B				//A				C stick Vert		
button_const_array[2]  = gp_face3								//Square			X				//B				L trigger analogue	
button_const_array[3]  = gp_face4								//Triangle			Y				//Y				R trigger analogue	
button_const_array[4]  = gp_shoulderl							//L1				L1				//L Trig Press	C stick Hori		
button_const_array[5]  = gp_shoulderr							//L2				L2				//R Trig Press						
button_const_array[6]  = gp_select								//PS				SELECT			//-									
button_const_array[7]  = gp_start								//OPTIONS			START			//START								
button_const_array[8]  = gp_stickl								//L3				L3				//-									
button_const_array[9]  = gp_stickr								//R3				R3				//-									
button_const_array[10] = gp_padu								//D-Pad UP			D-Pad UP		//D-Pad UP							
button_const_array[11] = gp_padd								//D-Pad DOWN		D-Pad DOWN		//D-Pad RIGHT						
button_const_array[12] = gp_padl								//D-Pad LEFT		D-Pad LEFT		//D-Pad DOWN						
button_const_array[13] = gp_padr		//buttons end			//D-Pad RIGHT		D-Pad RIGHT		//D-Pad LEFT						
button_const_array[14] = gp_shoulderrb	//triggers start		//RIGHT TRIGGER		RIGHT TRIGGER	//Z									
button_const_array[15] = gp_shoulderlb	//triggers end			//LEFT TRIGGER		LEFT TRIGGER	//-									
button_const_array[16] = gp_axislh		//axis start			//L STICK Hori		L STICK Hori	//L STICK Hori						
button_const_array[17] = gp_axislv								//L STICK Vert		L STICK Vert	//L STICK Vert						
button_const_array[18] = gp_axisrh								//R STICK Hori		R STICK Hori	//C STICK Vert						
button_const_array[19] = gp_axisrv		//axis end				//R STICK Vert		R STICK Vert	//L trigger							


//GameCube			
button_const_array[0]  = gp_face2		//A			
button_const_array[1]  = gp_face3		//B			
button_const_array[2]  = gp_face4		//Y			
button_const_array[3]  = gp_face1		//X			
button_const_array[4]  = gp_select		//-			
button_const_array[5]  = gp_shoulderrb	//Z			
button_const_array[6]  = gp_select		//-			
button_const_array[7]  = gp_start		//START		
button_const_array[8]  = gp_select		//-			
button_const_array[9]  = gp_select		//-			
button_const_array[10] = gp_padu		//U			
button_const_array[11] = gp_padl		//D			
button_const_array[12] = gp_padr		//L			
button_const_array[13] = gp_padd		//R			
button_const_array[14] = gp_face3		//L trig		
button_const_array[15] = gp_face4		//R trig		
button_const_array[16] = gp_axislh		//L H		
button_const_array[17] = gp_axislv		//L V		
button_const_array[18] = gp_shoulderl	//-R H		
button_const_array[19] = gp_axisrh		//R V		
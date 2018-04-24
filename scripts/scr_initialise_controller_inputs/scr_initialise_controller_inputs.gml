///@func scr_initialise_controller_inputs(player_number)
///@desc Initialises the given player number inputs to be controller
///@param player_number - the slot of the player


trigger_threshold[argument[0]] = 0.5			//trigger threshold for triggers
												//constants			GameCube		PSX				XBOX/GENRIC	
button_array[argument[0], 0]  = ATTACK			//gp_face1			A				Cross			A					
button_array[argument[0], 1]  = SPECIAL			//gp_face2			B				Circle			B			
button_array[argument[0], 2]  = JUMP			//gp_face3			X				Square			X			
button_array[argument[0], 3]  = JUMP			//gp_face4			Y				Triangle		Y				
button_array[argument[0], 4]  = GRAB			//gp_shoulderl		-				L1				L1					
button_array[argument[0], 5]  = GRAB			//gp_shoulderr		Z				L2				L2					
button_array[argument[0], 6]  = PAUSE			//gp_select			-				PS				SELECT					
button_array[argument[0], 7]  = PAUSE			//gp_start			START			OPTIONS			START				
button_array[argument[0], 8]  = LEFT_STICK		//gp_stickl			-				L3				L3					
button_array[argument[0], 9]  = RIGHT_STICK		//gp_stickr			-				R3				R3					
button_array[argument[0], 10] = TAUNT			//gp_padu			D-Pad UP		D-Pad UP		D-Pad UP			
button_array[argument[0], 11] = TAUNT			//gp_padd			D-Pad DOWN		D-Pad DOWN		D-Pad DOWN			
button_array[argument[0], 12] = TAUNT			//gp_padl			D-Pad LEFT		D-Pad LEFT		D-Pad LEFT			
button_array[argument[0], 13] = TAUNT			//gp_padr			D-Pad RIGHT		D-Pad RIGHT		D-Pad RIGHT			
button_array[argument[0], 14] = SHIELD			//gp_shoulderrb		RIGHT TRIGGER	RIGHT TRIGGER	RIGHT TRIGGER		
button_array[argument[0], 15] = SHIELD			//gp_shoulderlb		LEFT TRIGGER	LEFT TRIGGER	LEFT TRIGGER		
button_array[argument[0], 16] = XAXIS			//gp_axislh			L STICK Hori	L STICK Hori	L STICK Hori		
button_array[argument[0], 17] = YAXIS			//gp_axislv			L STICK Vert	L STICK Vert	L STICK Vert		
button_array[argument[0], 18] = ALT_XAXIS		//gp_axisrh			C STICK Hori	R STICK Hori	R STICK Hori		
button_array[argument[0], 19] = ALT_YAXIS		//gp_axisrv			C STICK Vert	R STICK Vert	R STICK Vert		

																//GameCube			PSX					XBOX/GENRIC	
button_const_array[0]  = gp_face1		//buttons start			//A					Cross				A				
button_const_array[1]  = gp_face2								//B					Circle				B			
button_const_array[2]  = gp_face3								//X					Square				X			
button_const_array[3]  = gp_face4								//Y					Triangle			Y				
button_const_array[4]  = gp_shoulderl							//-					L1					L1				
button_const_array[5]  = gp_shoulderr							//Z					L2					L2				
button_const_array[6]  = gp_select								//-					PS					SELECT			
button_const_array[7]  = gp_start								//START				OPTIONS				START			
button_const_array[8]  = gp_stickl								//-					L3					L3				
button_const_array[9]  = gp_stickr								//-					R3					R3				
button_const_array[10] = gp_padu								//D-Pad UP			D-Pad UP			D-Pad UP		
button_const_array[11] = gp_padd								//D-Pad DOWN		D-Pad DOWN			D-Pad DOWN		
button_const_array[12] = gp_padl								//D-Pad LEFT		D-Pad LEFT			D-Pad LEFT		
button_const_array[13] = gp_padr		//buttons end			//D-Pad RIGHT		D-Pad RIGHT			D-Pad RIGHT		
button_const_array[14] = gp_shoulderrb	//triggers start		//RIGHT TRIGGER		RIGHT TRIGGER		RIGHT TRIGGER	
button_const_array[15] = gp_shoulderlb	//triggers end			//LEFT TRIGGER		LEFT TRIGGER		LEFT TRIGGER	
button_const_array[16] = gp_axislh		//axis start			//L STICK Hori		L STICK Hori		L STICK Hori	
button_const_array[17] = gp_axislv								//L STICK Vert		L STICK Vert		L STICK Vert	
button_const_array[18] = gp_axisrh								//C STICK Hori		R STICK Hori		R STICK Hori	
button_const_array[19] = gp_axisrv		//axis end				//C STICK Vert		R STICK Vert		R STICK Vert	
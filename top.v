module top(
			input clock50,
			output reg VGA_CLK, 
			output VGA_BLANK, 
			output reg VGA_HS, 
			output reg VGA_VS, 
			output VGA_SYNC,
			output reg [9:0] VGA_R,
			output reg [9:0] VGA_G,
			output reg [9:0] VGA_B,
			//keyboard control inputs
			input clockps2,
			input data,
			input [2:0]SWBack,
			input [2:0]SWLetters
);
	
	reg resetall = 1;
	
	//25MHz clock
	always @ (posedge clock50)
	begin
		VGA_CLK = ~VGA_CLK;
	end
	
	assign VGA_BLANK = h_video_on	& v_video_on;
	assign VGA_SYNC = 1;
	
	//Horizontal logic
	reg [9:0] hcounter = 0;
	always @ (posedge VGA_CLK)
	begin
		if(hcounter < 799)
			hcounter <= hcounter + 1;
		else
			hcounter <= 0;
	end
	

	
	reg h_video_on = 0;
	always @ (posedge VGA_CLK)
	begin
		if(hcounter >= 639)
			h_video_on = 0;
		else
			h_video_on = 1;
	end
	
	always @ (posedge VGA_CLK)
	begin
		if(hcounter >= 655 & hcounter<=751)
			VGA_HS = 0;
		else
			VGA_HS = 1;
	end
	
	//Vertical logic
	reg [9:0] vcounter = 0;
	always @ (negedge VGA_HS)
	begin
		if(vcounter < 524)
			vcounter <= vcounter + 1;
		else
			vcounter <= 0;		
	end
	
	reg v_video_on = 0;
	always @ (negedge VGA_HS)
	begin
		if(vcounter >= 479)
			v_video_on = 0;
		else
			v_video_on = 1;
	end
	
	always @ (negedge VGA_HS)
	begin
		if(vcounter >= 489 & vcounter<=491)
			VGA_VS = 0;
		else
			VGA_VS = 1;
	end
	
	
	reg [9:0] coorx;
	reg [9:0] coory;
	//xcoordinate
	always @ (posedge VGA_CLK)
	begin
		if(hcounter >= 639)
			coorx <= 0;
		else 
			coorx <= coorx +1;
	end
	
	//ycoordinate
	always @ (posedge VGA_HS)
	begin
		if(vcounter >= 479)
			coory <= 0;
		else 
			coory <= coory +1;
	end
	
	
	
	//bit array
	reg [0:639] bits [0:479];
	
	reg[9:0] rojo_aux;
	reg[9:0] verde_aux;
	reg[9:0] azul_aux;
	reg[9:0] rojo_aux1;
	reg[9:0] verde_aux1;
	reg[9:0] azul_aux1;
	
	always @(*)
	begin
		case(SWBack[2])
			0: rojo_aux = 0;
			1:	rojo_aux = 1023;
		endcase
		
		case(SWBack[1])
			0: verde_aux = 0;
			1:	verde_aux = 1023;
		endcase
		
		case(SWBack[0])
			0: azul_aux = 0;
			1: azul_aux = 1023;
		endcase
		
		case(SWLetters[2])
			0: rojo_aux1 = 0;
			1:	rojo_aux1 = 1023;
		endcase
		
		case(SWLetters[1])
			0: verde_aux1 = 0;
			1: verde_aux1 = 1023;
		endcase
		
		case(SWLetters[0])
			0: azul_aux1 = 0;
			1: azul_aux1 = 1023;
		endcase
	end
	
	always @ (*)
	begin
		if(h_video_on	& v_video_on)
			begin
				if(bits[coory][coorx]==1)
					begin
					VGA_R = rojo_aux1; 
					VGA_G = verde_aux1;
					VGA_B = azul_aux1;
					end
				else
					begin
					VGA_R = rojo_aux; 
					VGA_G = verde_aux;
					VGA_B = azul_aux;
					end
			end
		else
			begin
				VGA_R = 0;
				VGA_G = 0;
				VGA_B = 0;
			end
	end
	
	
		reg flop1 = 0;
		reg flop2 = 0; 
		
		wire [7:0]keycode;
		shiftreg11bit shifter(clockps2, ~resetall, 1'b0, 11'b000000000000, clockps2, data, keycode);
		
		wire enable;
		counter cnt(.clock(clockps2),.reset(flop2),.enable(enable));
		
		always @ (posedge VGA_CLK or posedge (~resetall))
		begin
			if(~resetall)
				flop1 <= 0;
			else if(flop1)
				flop1 <= 0;
			else
				flop1 <= enable;
		end
		
		always @ (posedge VGA_CLK or posedge (~resetall))
		begin
			if(~resetall)
				flop2 <= 0;
			else
				flop2 <= flop1;
		end	
		
		wire [7:0] salida1;
		register8bit scancode(.clk(VGA_CLK),
													.rst(~resetall),
													.en(flop1),
													.D(keycode),
													.Q(salida1));
		
		wire [7:0] salida2;
		register8bit prevscancode(.clk(VGA_CLK),
										.rst(~resetall),
										.en(flop1),
										.D(salida1),
										.Q(salida2));
		
		
		wire count2;
		counter2 cnt2(.clock(clockps2),.reset(count2),.enable(count2));
		
		wire validate;
		assign validate = count2 & (~(salida2==8'hF0))& (~(salida1==8'hF0));		
		
		
		
		/*reg [9:0] refx = 0; 
		reg [9:0] refy = 0;*/
		reg[9:0] i, j;
		reg[9:0] k;
		
		reg [7:0] code[0:63];
		reg[5:0] index = 0;
		
		always @ (posedge validate)
		begin
				case(index)
					10'd0: code[0] <= salida1;
					10'd1: code[1] <= salida1;
					10'd2: code[2] <= salida1;
					10'd3: code[3] <= salida1;
					10'd4: code[4] <= salida1;
					10'd5: code[5] <= salida1;
					10'd6: code[6] <= salida1;
					10'd7: code[7] <= salida1;
					10'd8: code[8] <= salida1;
					10'd9: code[9] <= salida1;
					10'd10: code[10] <= salida1;
					10'd11: code[11] <= salida1;
					10'd12: code[12] <= salida1;
					10'd13: code[13] <= salida1;
					10'd14: code[14] <= salida1;
					10'd15: code[15] <= salida1;
					10'd16: code[16] <= salida1;
					10'd17: code[17] <= salida1;
					10'd18: code[18] <= salida1;
					10'd19: code[19] <= salida1;
					10'd20: code[20] <= salida1;
					10'd21: code[21] <= salida1;
					10'd22: code[22] <= salida1;
					10'd23: code[23] <= salida1;
					10'd24: code[24] <= salida1;
					10'd25: code[25] <= salida1;
					10'd26: code[26] <= salida1;
					10'd27: code[27] <= salida1;
					10'd28: code[28] <= salida1;
					10'd29: code[29] <= salida1;
					10'd30: code[30] <= salida1;
					10'd31: code[31] <= salida1;
					10'd32: code[32] <= salida1;
					10'd33: code[33] <= salida1;
					10'd34: code[34] <= salida1;
					10'd35: code[35] <= salida1;
					10'd36: code[36] <= salida1;
					10'd37: code[37] <= salida1;
					10'd38: code[38] <= salida1;
					10'd39: code[39] <= salida1;
					10'd40: code[40] <= salida1;
					10'd41: code[41] <= salida1;
					10'd42: code[42] <= salida1;
					10'd43: code[43] <= salida1;
					10'd44: code[44] <= salida1;
					10'd45: code[45] <= salida1;
					10'd46: code[46] <= salida1;
					10'd47: code[47] <= salida1;
					10'd48: code[48] <= salida1;
					10'd49: code[49] <= salida1;
					10'd50: code[50] <= salida1;
					10'd51: code[51] <= salida1;
					10'd52: code[52] <= salida1;
					10'd53: code[53] <= salida1;
					10'd54: code[54] <= salida1;
					10'd55: code[55] <= salida1;
					10'd56: code[56] <= salida1;
					10'd57: code[57] <= salida1;
					10'd58: code[58] <= salida1;
					10'd59: code[59] <= salida1;
					10'd60: code[60] <= salida1;
					10'd61: code[61] <= salida1;
					10'd62: code[62] <= salida1;
					10'd63: code[63] <= salida1;
				endcase
		end
		
		
		wire [749:0] char; //[0:31];
		decoder decode0(.in(code[index]),.out(char));
		
		reg validate2;
		reg validate3;
		
		always @ (negedge clock50)
			validate2 = validate;
		
		always @ (*)
			validate3 = (validate & validate2);
		
		always @ (negedge validate3)
		begin
			case(index)
				10'd0:
					begin
						k=749;  
						for(j=0; j<30; j=j+1) begin
							for(i=0; i<25; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end					
					end
				10'd1:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=25; i<50; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end				
					end			
				10'd2:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=50; i<75; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end			
				10'd3:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=75; i<100; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end				
					end		
				10'd4:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=100; i<125; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end				
					end
				10'd5:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=125; i<150; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end				
					end
				10'd6:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=150; i<175; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end				
					end
				10'd7:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=175; i<200; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd8:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=200; i<225; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd9:
					begin				
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=225; i<250; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd10:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=250; i<275; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd11:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=275; i<300; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd12:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=300; i<325; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd13:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=325; i<350; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd14:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=350; i<375; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd15:
					begin
						k=749;
						for(j=0; j<30; j=j+1) begin
							for(i=375; i<400; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd16:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=0; i<25; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd17:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=25; i<50; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd18:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=50; i<75; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd19:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=75; i<100; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd20:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=100; i<125; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd21:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=125; i<150; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd22:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=150; i<175; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd23:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=175; i<200; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd24:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=200; i<225; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd25:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=225; i<250; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd26:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=250; i<275; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd27:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=275; i<300; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd28:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=300; i<325; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd29:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=325; i<350; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd30:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=350; i<375; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd31:
					begin
						k=749;
						for(j=30; j<60; j=j+1) begin
							for(i=375; i<400; i=i+1) begin
								bits[j][i] = char[k] ;
								k=k-1;
							end
						end
					end
				10'd32:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=0; i<25; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd33:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=25; i<50; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd34:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=50; i<75; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd35:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=75; i<100; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd36:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=100; i<125; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd37:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=125; i<150; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd38:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=150; i<175; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd39:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=175; i<200; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd40:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=200; i<225; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd41:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=225; i<250; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd42:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=250; i<275; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd43:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=275; i<300; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd44:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=300; i<325; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd45:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=325; i<350; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd46:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=350; i<375; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd47:
					 begin
						  k=749;
						  for(j=60; j<90; j=j+1) begin
								for(i=375; i<400; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd48:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=0; i<25; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd49:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=25; i<50; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd50:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=50; i<75; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd51:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=75; i<100; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd52:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=100; i<125; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd53:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=125; i<150; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd54:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=150; i<175; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd55:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=175; i<200; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd56:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=200; i<225; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd57:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=225; i<250; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd58:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=250; i<275; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd59:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=275; i<300; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd60:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=300; i<325; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd61:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=325; i<350; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd62:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=350; i<375; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
				10'd63:
					 begin
						  k=749;
						  for(j=90; j<120; j=j+1) begin
								for(i=375; i<400; i=i+1) begin
									 bits[j][i] = char[k] ;
									 k=k-1;
								end
						  end
					 end
			endcase
			index <= index+1;
			end
endmodule

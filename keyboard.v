module keyboard(
			input clockps2,
			input clockfpga,
			input data,
			input resetall
			);
		
		reg [0:639] bits [0:479];
		
		reg flop1 = 0;
		reg flop2 = 0; 
		
		wire [7:0]keycode;
		shiftreg11bit shifter(clockps2, ~resetall, 1'b0, 11'b000000000000, clockps2, data, keycode);
		
		wire enable;
		counter cnt(.clock(clockps2),.reset(flop2),.enable(enable));
		
		always @ (posedge clockfpga or posedge (~resetall))
		begin
			if(~resetall)
				flop1 <= 0;
			else if(flop1)
				flop1 <= 0;
			else
				flop1 <= enable;
		end
		
		always @ (posedge clockfpga or posedge (~resetall))
		begin
			if(~resetall)
				flop2 <= 0;
			else
				flop2 <= flop1;
		end	
		
		wire [7:0] salida1;
		register8bit scancode(.clk(clockfpga),
													.rst(~resetall),
													.en(flop1),
													.D(keycode),
													.Q(salida1));
		
		wire [7:0] salida2;
		register8bit prevscancode(.clk(clockfpga),
										.rst(~resetall),
										.en(flop1),
										.D(salida1),
										.Q(salida2));
		
		
		wire count2;
		counter2 cnt2(.clock(clockps2),.reset(count2),.enable(count2));
		
		
		wire validate;
		assign validate = count2 & (~(salida2==8'hF0))& (~(salida1==8'hF0));		
		
		
		reg [2:0] address = 3'b111;
		always @ (posedge validate)
		begin	
			if (~resetall)
				address <= 3'b111;
			else if (validate)
				address <= address - 1;
		end
		
		wire [749:0] char;
		decoder decode(.in(keycode),.out(char));
		
		reg [9:0] refx, refy;
		integer i, j;
		integer k;
		
		always @ (posedge clockfpga)
		begin
			if(validate)
			begin
				k=749;
				for(j=0+refy; j<30+refy; j=j+1) begin
					for(i=0+refx; i<25+refx; i=i+1) begin
						bits[j][i] = char[k] ;
						k=k-1;
					end
				end
				if((refx+25)>= 640)
					refx<=0;
				else
					refx <= refx+25;	
				if((refy+30)>= 480)
					refy<=0;
				else
					refy <= refy+30;
			end
		end
		
		
		
		
		
endmodule

module hexregister(
			input clock,
			input reset,
			input enable,
			input [7:0] writeData,
			input [3:0] writeAddress,
			output [63:0] hex);
			
			
			reg [63:0] register;
			
			always @ (posedge clock) 
				if(reset)
						register <= 0;
				else if (enable)
				begin
					case(writeAddress)
						3'd0: register[7:0] <= writeData;
						3'd1:	register[15:8] <= writeData;
						3'd2: register[23:16] <= writeData;
						3'd3: register[31:24] <= writeData;
						3'd4: register[39:32] <= writeData;
						3'd5: register[47:40] <= writeData;
						3'd6: register[55:48] <= writeData;
						3'd7: register[63:56] <= writeData;
					endcase
				end
				
			assign hex = register;
			
endmodule

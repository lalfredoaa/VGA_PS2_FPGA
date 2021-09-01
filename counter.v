module counter (
					input clock,
					input reset,
					output reg enable);
		
		reg [3:0] counter;
		
		always @ (negedge clock or posedge reset)
			begin 
				if(reset)
					counter <= 0;
				else
					counter <= counter + 1;
			end
					
		always @ (*)
			if(counter == 4'd11)
				enable = 1;
			else
				enable = 0;
endmodule

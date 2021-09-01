module counter2 (
					input clock,
					input reset,
					output reg enable);
		
		reg [3:0] counter;
		
		always @ (posedge clock)
			begin 
				if(reset)
					counter <= 0;
				else
					counter <= counter + 1;
			end
					
		always @ (*)
			if(counter == 4'd12)
				enable = 1;
			else
				enable = 0;
endmodule

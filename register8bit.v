module register8bit (
		input clk,
		input rst,
		input en,
		input [7:0]D,
		output reg[7:0]Q
		);
		
		always @ (posedge clk)
			if (rst)
				Q <= 0;
			else if (en)
				Q <= D;
endmodule

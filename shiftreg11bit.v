module shiftreg11bit (
	input 		clk,
	input 		rst,
	input       load,
	input [10:0] data,
	input 		shren,
	input 		din,
	output [7:0] dout
	); 

	reg [10:0] ShiftRegister;
	
	always @ (negedge clk) begin
		if (rst)	// Active High Reset (if Active Low is needed just negate ~rst)
			ShiftRegister <= 0;
		else if (load)  // Parallel Load input  ( has priority over shren )
			ShiftRegister <= data;
		else if (shren)	// Shift Enable input
			ShiftRegister[10:0] <= {din,ShiftRegister[10:1]};
	end
	
	// Combinatorial Output, the output of the Right ShiftRegister is always the LSb
	assign dout = ShiftRegister[8:1];
endmodule

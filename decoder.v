module decoder(
		input [7:0] in,
		output [749:0] out);
		
		
		reg [749:0] HEX;
		always @ (*)
			begin
				case(in)
					8'h45: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111000000000000000000011111110000000000000000011100011100000000000000001100000110000000000000001100000001100000000000000110000000110000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011000000011000000000000001100000001100000000000000110000001100000000000000001100000110000000000000000111000111000000000000000001111111000000000000000000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
					8'h16: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000111000000000000000000001111100000000000000000000111110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000001111111100000000000000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
					8'h1E: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000000111111110000000000000000010000011100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000001100000000000000000000000110000000000000000000000110000000000000000000000111000000000000000000000111000000000000000000000111000000000000000000000110000000000000000000000111000000000000000000000011111111110000000000000001111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
					8'h26: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000000111111110000000000000000010000011100000000000000000000000110000000000000000000000011000000000000000000000111000000000000000000001110000000000000000000000111100000000000000000000000011100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000001110000000000000000110001110000000000000000011111110000000000000000000111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
					8'h25: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000001110000000000000000000001111000000000000000000001111100000000000000000001110110000000000000000000110011000000000000000001110001100000000000000000110000110000000000000000111000011000000000000000011111111111000000000000001111111111100000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //4 
					8'h2E: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111000000000000000011111111100000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000111111000000000000000000011111111000000000000000000000011110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000111000000000000000110000011000000000000000011111111000000000000000000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //5 
					8'h36: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111100000000000000000001111110000000000000000001110000000000000000000001100000000000000000000000110000000000000000000000110000000000000000000000011011111000000000000000001111111111000000000000000111000001100000000000000011000000011000000000000001100000001100000000000000110000000110000000000000001100000111000000000000000111000111000000000000000001111111000000000000000000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //6 
					8'h3D: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111000000000000000111111111100000000000000000000000110000000000000000000000011000000000000000000000011000000000000000000000001100000000000000000000001100000000000000000000001110000000000000000000000110000000000000000000000111000000000000000000000011000000000000000000000011000000000000000000000001100000000000000000000001110000000000000000000000110000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //7
					8'h3E: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111000000000000000000111111111000000000000000111000001110000000000000011000000011000000000000001100000001100000000000000111000001100000000000000001111001100000000000000000011111100000000000000000011000111100000000000000011000000110000000000000001100000001100000000000000110000000110000000000000011000000011000000000000000111000111000000000000000011111111100000000000000000011111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //8
					8'h46: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111000000000000000000111111110000000000000000011000001100000000000000011000000110000000000000001100000001100000000000000110000000110000000000000011000000011000000000000000110000111100000000000000011111111110000000000000000011110011000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000001110000000000000000001111110000000000000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //9
					
					8'h1C: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011100000000000000000000001111000000000000000000000110100000000000000000000110111000000000000000000011001100000000000000000001100110000000000000000001100001100000000000000000110000110000000000000000011000011000000000000000011000000110000000000000001111111111000000000000000111111111100000000000000110000000011000000000000011000000001100000000000011100000000111000000000001100000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //A
					8'h32: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111000000000000000001111111110000000000000000110000011100000000000000011000000110000000000000001100000011000000000000000110000011000000000000000011111111000000000000000001111111111000000000000000110000001100000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011000000111000000000000001100000111000000000000000111111111000000000000000011111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //B
					8'h21: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111110000000000000000011111111110000000000000011100000111000000000000011000000000100000000000001100000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000000110000000000000000000000011100000000100000000000000111000011110000000000000001111111111000000000000000011111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //C
					8'h23: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110000000000000000011111111110000000000000001100000011100000000000000110000000111000000000000011000000001100000000000001100000000011000000000000110000000001100000000000011000000000110000000000001100000000011000000000000110000000001100000000000011000000001100000000000001100000000110000000000000110000000111000000000000011000001111000000000000001111111111000000000000000111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //D
					8'h24: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111000000000000000111111111100000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001111111111000000000000000111111111100000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011111111110000000000000001111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //E
					8'h2B: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111100000000000000011111111110000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000111111111000000000000000011111111100000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //F
					8'h34: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111100000000000000000111111111100000000000000111000001110000000000000111000000001000000000000011000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000001111110000000000001100000111111000000000000110000000001100000000000001100000000110000000000000111000000011000000000000001110000101100000000000000011111111110000000000000000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //G
					8'h33: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000001100000000000001100000000110000000000000110000000011000000000000011000000001100000000000001100000000110000000000000110000000011000000000000011111111111100000000000001111111111110000000000000110000000011000000000000011000000001100000000000001100000000110000000000000110000000011000000000000011000000001100000000000001100000000110000000000000110000000011000000000000011000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //H
					8'h43: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000000011111100000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000001111110000000000000000000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //I
					8'h3B: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111100000000000000000000111110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000001110000000000000000011111110000000000000000001111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //J
					8'h42: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000001110000000000001100000001100000000000000110000001100000000000000011000001110000000000000001100001100000000000000000110001100000000000000000011001100000000000000000001101110000000000000000000111111000000000000000000011101110000000000000000001100011100000000000000000110000111000000000000000011000001110000000000000001100000011100000000000000110000000111000000000000011000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //K
					8'h4B: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001111111111000000000000000111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //L
					8'h3A: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111000000001110000000000011110000001111000000000001111000000111100000000000110100000010110000000000011011000011011000000000001101100001101100000000000110011001100110000000000011001100110011000000000001100011110001100000000000110001111000110000000000011000011000011000000000001100001100001100000000000110000000000110000000000011000000000011000000000001100000000001100000000000110000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //M
					8'h31: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011110000001100000000000001111000000110000000000000111110000011000000000000011011000001100000000000001100110000110000000000000110011000011000000000000011001110001100000000000001100011000110000000000000110000110011000000000000011000011001100000000000001100001110110000000000000110000011011000000000000011000000111100000000000001100000011110000000000000110000000111000000000000011000000011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //N
					8'h44: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000000111111111000000000000000111000001110000000000000111000000011100000000000011000000000110000000000011000000000001100000000001100000000000110000000000110000000000011000000000011000000000001100000000001100000000000110000000000110000000000111000000000001100000000011000000000000111000000011100000000000001110000111100000000000000011111111100000000000000000101111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //O
					8'h4D: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111000000000000000000111111111000000000000000011000001100000000000000001100000111000000000000000110000001100000000000000011000000110000000000000001100000111000000000000000110000011000000000000000011111111000000000000000001111111000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //P
					8'h15: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000000111111111000000000000000111000001110000000000000111000000011100000000000011000000000110000000000011000000000001100000000001100000000000110000000000110000000000011000000000011000000000001100000000001100000000000110000000000110000000000111000000000001100000000011000000000000111000000011100000000000001110000111100000000000000011111111000000000000000000111111000000000000000000000001100000000000000000000000111000000000000000000000001111110000000000000000000011111000000000000000000000000000000000000000000000000000000000000000000000000000000000; //Q
					8'h2D: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111110000000000000000001111111110000000000000000110000011100000000000000011000000110000000000000001100000011000000000000000110000001100000000000000011000001100000000000000001100001110000000000000000111111110000000000000000011111110000000000000000001100001100000000000000000110000111000000000000000011000001110000000000000001100000011100000000000000110000000111000000000000011000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //R
					8'h1B: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000001111111111000000000000000110000001100000000000000110000000000000000000000011000000000000000000000001100000000000000000000000111100000000000000000000000111111100000000000000000001111111100000000000000000000001110000000000000000000000001100000000000000000000000110000000000000100000000011000000000000011100000111000000000000001111111111000000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //S
					8'h2C: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111000000000000011111111111100000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //T
					8'h3C: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011000000011000000000000001100000001100000000000000110000000110000000000000011100000110000000000000000110000111000000000000000001111111000000000000000000011111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //U
					8'h2A: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000001100000000000011000000001100000000000001100000000110000000000000110000000011000000000000001100000011000000000000000110000001100000000000000011000000110000000000000000110000110000000000000000011000011000000000000000001100011100000000000000000011001100000000000000000001100110000000000000000000110110000000000000000000001111000000000000000000000111100000000000000000000011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //V
					8'h1D: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000001110000001100000011000000111000001110000000110000011100000010000000011000011010000011000000001100000101100001100000000110000110110001110000000001100011011000010000000000110001000100011000000000011001100011001100000000001100110001100110000000000011010000110110000000000001101100001011000000000000111100000111100000000000011110000011100000000000000110000001110000000000000011000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //W
					8'h22: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111000000111000000000000001100000011000000000000000011000011000000000000000001100001100000000000000000011001100000000000000000001110110000000000000000000011110000000000000000000000110000000000000000000000111100000000000000000000011110000000000000000000011001100000000000000000001100110000000000000000001100001100000000000000001110000110000000000000000110000001100000000000000110000000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //X
					8'h35: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111000000111000000000000001100000011000000000000000111000011100000000000000001100001100000000000000000011001100000000000000000001100110000000000000000000111010000000000000000000001111000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000110000000000000000000000011000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //Y
					8'h1A: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111000000000000011111111111100000000000000000000001100000000000000000000001110000000000000000000000110000000000000000000000110000000000000000000000110000000000000000000000111000000000000000000000111000000000000000000000011000000000000000000000011000000000000000000000011000000000000000000000011100000000000000000000011100000000000000000000001111111111110000000000000111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //Z
					8'h05: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000011100000000000000000000111110000000000000000001111111110000000000000011110001111100000000000001100000001110000000000001110000000001100000000000111000000000000000000000011100000000000000000000001100000000000000000000000110011110000000000000000011011111100000000000000001001111111111000000000000100101111111100000000000100000001101110100000000010000011100110000000000001000000100000000000000000100000001000000000000000011001111111100000000000001111111111110000000000000111111100111000000000000111111001101100000000000111111111110110000000000001111111111010000000000000011111111111000000000000001111111111000000000000000011111100000000000000000000011100000000000000000000000000000000000000; //Haro
					8'h06: HEX= 750'b000000000000000000000000000000000001111010000000000000000011111111110000000000000111111111111110000000000111111111111111000000000011111111111111110000000011111100000111111100000001111000000001111110000001111000000000011111000000111111110000011111100000011111101000011111111000001110011111111111111100001111111111111111011110000111110110101111011111000011110000010011100111100001101100010001000011100000111001110000011111110000011110000000000000111000001111000000000000011100000111110001111100011110000011111100000000011111000001111111000000011111100000111111110000011111110000011111111111111111111000001111111111111111111100000111111111111111111110000011111111111111111111000000111100101111111111100000000000000000000011110000000000000000000000000000; //Adry
					8'h04: HEX= 750'b000000010000000000000000000000001000000000000000000000000111111111000000000000000111111111110000000000000111111111111100000000000111111111111111000000000111111111111111110000000011111111111111111000000011111111110001111110000001111111000000011111000000111111000000001111110000001111100000000011110000000111111111000111111000000111111111110111111000000011100111110011111100000001110000000000111010000000110000000000000000000000001000000000000000000000000100000000000000000000000000000000110000000000000000100000011100000000000000111100000000000000000011111110011111100000000001111111100110000000000000111111111111100000000000011111111111110011100000001111111111100011111100000111111111111111111111000011111111111111111111111001111111111111111111111110; //Erick
					8'h0C: HEX= 750'b000000000000000000000000000000000001111100000000000000000011111111111000000000000011111111111110000000000111100000011111100000000111100000000000110000000011100000000000001100000001110000000000000010000001110000000000000001000000111000001110000000000000011100000000000011001000001100000110000011110101000110000011100000000010000001000000000000011100000000000000000000000110000000000000000001000000000000000000000000101100000000000000000000000010000000000000000000000000000000000000000000011111000000000000000000000000010000000000000000000000000000000000011000000000000000111100011100000000000000011111011110000000000000011111111111100100111111111111111111111001111111111111111111111110011111111111111111111111110011111111111111111111111111000111111111; //JLo
					8'h03: HEX= 750'b000000000000000000000000000000000000111000000000000000000111111111110000000000001111111111111110000000001111111111111111100000000110000011111111111000000110000000000000001100000011000000000000000011000001000000000000000001100000100000000000000000110000010111110000001100011000011111110000001001101100001100011111111111111110000110101101111100000011000011001111110101110001000001100111010010111001100000010000011001001100110000001100001000010000011000000011111000001100011000000001000000000001111000000000100000000000000100000000001000000000000100000000000100000000000100000000000001001111000100000000000000010000000100000000000000000111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //Edu
					8'h0B: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011110000000000000000000001100100000010000000000000110010011011110001110000010111001100100001000100000011100010010001100010000111010001001000111111000000000000100100010000000001111100010010000100010000111100000000110001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //ITE
					default: HEX= 750'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; //off
				endcase
			end 
			
		assign out = HEX;
endmodule
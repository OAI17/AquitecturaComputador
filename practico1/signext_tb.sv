module signext_tb();
	logic [31:0] a;
	logic [63:0] y;
	logic [31:0] testvectors [0:4]= '{32'b11111000010_111111111_01_00000_00000, // type D
 												32'b11111000010_000000000_01_00000_00000, // type D
												32'b11111000000_111111110_01_00000_00000, // type D
												32'b11111000000_000000000_01_00000_00000, // type D
												32'b10110100_0000000000000011000_00000}; // type CB

	// instance
	signext dut(a, y);

	initial 
		begin
			a = testvectors[0]; #1000;
			a = testvectors[1]; #1000;
			a = testvectors[2]; #1000;
			a = testvectors[3]; #1000;
			a = testvectors[4]; #1000;			
		end

endmodule
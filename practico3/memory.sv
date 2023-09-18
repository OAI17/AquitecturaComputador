// Etapa: MEMORY

module memory (input logic Branch_M, zero_M, branchtoReg,
			   output logic PCSrc_M);

	assign PCSrc_M = (Branch_M & zero_M) | branchtoReg;

endmodule

module execute #(parameter N=64)
				(input logic [1:0] AluSrc,
				 input logic PC_BR,
				 input logic [3:0] AluControl,
				 input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E, readData3_E,
				 output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
				 output logic zero_E);

	logic [N-1:0] mux_out, sl2_out;

	mux4  #(N) MUX_E(readData2_E, signImm_E, readData3_E, readData3_E, AluSrc, mux_out);
	alu        ALU(readData1_E, mux_out, AluControl, aluResult_E, zero_E);
	sl2   #(N) ShiftLeft_E(signImm_E, sl2_out);
	
	logic [N-1:0] adder_br_out;
	adder #(N) Add_E(sl2_out, PC_E, adder_br_out);
	
	/* Branch mux*/
	// si no anda camiar readData1_E por readData2_E para machear con rn
	mux2 #(N) MUX_BR(adder_br_out, readData1_E,PC_BR,PCBranch_E);

	assign writeData_E = readData2_E;
endmodule

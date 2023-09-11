module execute #(parameter N = 64)
					(input logic AluSrc,
					input logic [3:0] AluControl,
					input logic [N-1:0] PC_E,
					input logic [N-1:0] signImm_E,
					input logic [N-1:0] readData1_E,
					input logic [N-1:0] readData2_E,
					output logic [N-1:0] PCBranch_E,
					output logic [N-1:0] aluResult_E,
					output logic [N-1:0] writeData_E,
					output logic zero_E);

	logic [N-1:0] shift_out,mux2_out;
	
	alu ALU(readData1_E,mux2_out,AluControl,aluResult_E,zero_E); 
	
	sl2 SL2(signImm_E,shift_out);
	
	adder ADDER(PC_E, shift_out,PCBranch_E);
	
	mux2 MUX2(readData2_E,signImm_E,AluSrc,mux2_out);
	
	assign writeData_E = readData2_E;		

endmodule

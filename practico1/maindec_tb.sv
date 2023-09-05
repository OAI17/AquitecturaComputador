module maindec_tb();

	logic [10:0] Op;
	logic Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
	logic [1:0] ALUOp;
	
	maindec dut(Op,Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
	initial
		begin
			logic [10:0] testvector [0:3] = {11'b111_1100_0010, 11'b111_1100_0000, 11'b101_1010_0000, 11'b100_0101_1000}; // LDUR,STUR,CBZ,ADD
			Op = testvector[0];
			#10;
			Op = testvector[1];
			#10;
			Op = testvector[2];
			#10;
			Op = testvector[3];
			#10;
		end
		
endmodule

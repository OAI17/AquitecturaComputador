module maindec (input logic [10:0] Op,
					 input logic reset,
					 output logic PC_BR,
					 output logic  Reg2Loc,
					 output logic [1:0] ALUSrc,
					 output logic MemtoReg,
					 output logic RegWrite,
					 output logic MemRead,
					 output logic MemWrite,
					 output logic Branch,
					 output logic [1:0] ALUOp,
					 output logic ERet,
					 output logic NotAnInstr,
					 output logic [2:0] EStatus);

	always_comb
		begin
			casez (Op[10:0])
				11 'b110_1011_0000 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10; ERet = 0; NotAnInstr = 0; PC_BR = 1;end//BR
				11 'b111_1100_0010 : begin Reg2Loc = 0; ALUSrc = 01; MemtoReg = 1; RegWrite = 1; MemRead = 1; MemWrite = 0; Branch = 0; ALUOp = 00; ERet = 0; NotAnInstr = 0; PC_BR = 0;end//LDUR 
				11 'b111_1100_0000 : begin Reg2Loc = 1; ALUSrc = 01; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 1; Branch = 0; ALUOp = 00;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//STUR
				11 'b101_1010_0??? : begin Reg2Loc = 1; ALUSrc = 00; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 1; ALUOp = 01;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//CBZ
				11 'b100_0101_1000 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//ADD
				11 'b110_0101_1000 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//SUB
				11 'b100_0101_0000 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//AND
				11 'b101_0101_0000 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	ERet = 0; NotAnInstr = 0; PC_BR = 0;end//ORR
				11 'b110_1011_0100 : begin Reg2Loc = 0; ALUSrc = 00; MemtoReg = 1'bx; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 1; ALUOp = 01; ERet = 1; NotAnInstr = 0; PC_BR = 0;end//ERET
				11 'b110_1011_0000 : begin Reg2Loc = 1; ALUSrc = 1'bx; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 01;  ERet = 0; NotAnInstr = 0; PC_BR = 0;end// MRS
				default : begin Reg2Loc = 1'bx; ALUSrc = 2'bxx; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'bxx; ERet = 0; NotAnInstr = 1; PC_BR = 0;end //Not an instruccion
			endcase
				
			if (reset)
				Reg2Loc = 0; ALUSrc = 00; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 00; ERet = 0; PC_BR = 0;
		end
		
endmodule

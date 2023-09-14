// CONTROLLER

module controller(input logic [10:0] instr,
						input logic ExcAck,ExtIRQ,reset,
						output logic ExtlAck,Exc,ExtIAck,
						output logic [1:0] AluSrc,
						output logic [3:0] AluControl,EStatus,						
						output logic reg2loc, regWrite, Branch,memtoReg, memRead, memWrite,ERet,PC_BR);
											
	logic [1:0] AluOp_s;
	logic NotAnInstr;
											
	maindec 	decPpal 	(.Op(instr), 
							.Reg2Loc(reg2loc), 
							.ALUSrc(AluSrc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch), 
							.ALUOp(AluOp_s),
							.ERet(ERet),
							.NotAnInstr(NotAnInstr),
							.PC_BR(PC_BR),
							.reset(reset));	
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl));
	
	assign Exc = ExtIRQ | NotAnInstr;
	assign ExtIAck = ExcAck & ExtIRQ;
	
	always_comb
		begin
			if (reset)
				EStatus = 4'b0000;
			else if (NotAnInstr)
				EStatus = 4'b0010;
			else if (ExtIRQ)
				EStatus = 4'b0001;
			else 
				EStatus = 4'b0000;
		end 	
		
endmodule

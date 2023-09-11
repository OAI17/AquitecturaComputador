// CONTROLLER

module controller(input logic [10:0] instr,
						input logic ExcAck,ExtIRQ,
						output logic ExtlAck,Eret,Exc,
						output logic [1:0] AluSrc
						output logic [3:0] AluControl,EStatus,						
						output logic reg2loc, regWrite, Branch,memtoReg, memRead, memWrite,Eret,
						output logic [2:0] Estatus);
											
	logic [1:0] AluOp_s;
											
	maindec 	decPpal 	(.Op(instr), 
							.Reg2Loc(reg2loc), 
							.ALUSrc(AluSrc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch), 
							.ALUOp(AluOp_s),
							.ERet(Eret),
							.EStatus(Estatus));	
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl));
			
endmodule

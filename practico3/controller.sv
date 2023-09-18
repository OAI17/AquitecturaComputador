// CONTROLLER

module controller(input logic [10:0] instr,
						input logic reset, extIRQ, excAck,
						output logic [3:0] AluControl, EStatus,
						output logic [1:0] AluSrc,
						output logic reg2loc, regWrite, Branch, memtoReg, memRead,
											memWrite, exc, extIAck, eRet, branchtoReg);
											
	logic NotAnInstr_s;
	logic [1:0] AluOp_s;
											
	maindec 	decPpal 	(.Op(instr),
							.Reset(reset),
							.Reg2Loc(reg2loc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch),
							.NotAnInstr(NotAnInstr_s),
							.ERet(eRet),
							.BranchToReg(branchtoReg),
							.ALUSrc(AluSrc),
							.ALUOp(AluOp_s));
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl));
							
	always_comb begin
		if(extIRQ) EStatus = 4'b0001;
		else if(NotAnInstr_s) EStatus = 4'b0010;
		else EStatus = 4'b0000;
	end
	
	assign exc = extIRQ | NotAnInstr_s;
	assign extIAck = excAck && extIRQ;
			
endmodule

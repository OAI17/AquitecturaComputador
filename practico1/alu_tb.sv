module alu_tb();
	logic [63:0] a,b,result;
	logic [3:0] ALUControl;
	logic [63:0] atestvectors [0:4] = '{-64'h1,64'hFFFFFFFFFFFFFFFF, 64'hA, 64'h0, 64'hFFFFFFFFFFFFFFFF};
	logic [63:0] btestvectors [0:4] = '{64'h2,64'h0, 64'hA, 64'hFFFFFFFFFFFFFFFF, 64'H1};
	logic zero;
	// instance
	alu dut(a,b,ALUControl,result,zero);
	
	initial
		begin
			a = atestvectors[0]; b = btestvectors[0]; ALUControl = 4'b0010; #1000; // add	result = 1
			a = atestvectors[1]; b = btestvectors[1]; ALUControl = 4'b0000; #1000; // and  result = 0
			a = atestvectors[2]; b = btestvectors[2]; ALUControl = 4'b0110; #1000; // sub  result = 0
			a = atestvectors[3]; b = btestvectors[3]; ALUControl = 4'b0010; #1000; // or	result = 1
			a = atestvectors[4]; b = btestvectors[4]; ALUControl = 4'b0010; #1000; // add	result = 0
		end
endmodule

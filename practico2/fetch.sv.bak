module fetch (input logic PCSrc_F,
					input logic clk,
					input logic reset,
					input logic [63:0] PCBranch_F,
					output logic [63:0] imem_addr_F);
	
	logic [63:0] mux_out,q,adder_out;
	
	flopr dut1(clk,reset,mux_out,q);
	
	mux2 dut2(PCBranch_F, adder_out,PCSrc_F,mux_out);
	
	adder dut3(q,64'd4,adder_out);
	
	assign imem_addr_F = q;
	
endmodule

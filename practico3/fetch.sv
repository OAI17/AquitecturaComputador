module fetch #(parameter N = 64)
					(input logic PCSrc_F,
					input logic clk,
					input logic reset,
					input logic [N-1:0] PCBranch_F,
					output logic [N-1:0] imem_addr_F);
	
	logic [N-1:0] mux_out,q,adder_out;
	logic [63:0] four = 64'd4;
	
	flopr FLOPR(clk,reset,mux_out,q);
	
	mux2 MUX2(adder_out,PCBranch_F,PCSrc_F,mux_out);
	
	adder ADDER(q,four,adder_out);
	
	assign imem_addr_F = q;
	
endmodule

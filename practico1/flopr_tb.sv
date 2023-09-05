module flopr_tb();
	logic clk, reset;
	logic [31:0]it;
	logic [63:0] d, q;
	logic [63:0] testvectors [9:0] = '{ 64'hAAAA_AAAA_AAAA_AAAA,
													64'hAAAA_AAAA_AAAA_AAAB,
													64'hAAAA_AAAA_AAAA_AAAC,
													64'hAAAA_AAAA_AAAA_AAAD,
													64'hAAAA_AAAA_AAAA_AAAE,
													64'hAAAA_AAAA_AAAA_AAAF,
													64'hAAAA_AAAA_AAAA_AAA1,
													64'hAAAA_AAAA_AAAA_AAA2,
													64'hAAAA_AAAA_AAAA_AAA3,
													64'hAAAA_AAAA_AAAA_AAA4};

	// instance
	flopr #(64) dut(clk, reset, d, q);

	initial 
		begin 
			it = 0; reset = 1; 
		end
	
	
	
	// generate clock
	always // no sensitivity list, so it always executes
		begin
		clk = 1; #5000; clk = 0; #5000;
		end

	always @(negedge clk)
		begin
		d = testvectors[it]; #1;
		it = it + 1;
		if (it > 5)
			reset = 0;
		end

endmodule
module regfile_tb();
	logic clk,we3;
	logic [4:0] ra1,ra2,wa3;
	logic [63:0] wd3,rd1,rd2;

	regfile dut(clk,we3,ra1,ra2,wa3,wd3,rd1,rd2);

	always 
		begin
			clk = 1; #5; clk = 0; #5; 
		end
	
	logic [31:0] i;
	
	initial 
		begin 
			i = 5'b0; we3 = 0;
			
			/*TEST2*/
			we3 = 1; wd3 = 64'hCAFE_CAFE_CAFE; wa3 = 5'b0; ra1 = 0;
			#2
			assert(rd1 == 64'b0);
			#10
			/*TEST3*/
			we3 = 0; wd3 = 64'hCAFE_CAFE_CAFE; wa3 = 5'b00001; ra2 = 5'b00001;
			#2
			assert(rd2 != 64'hCAFE_CAFE_CAFE);
			#10
			/*TEST3*/
			we3 = 1; wd3 = 64'hCAFE_CAFE_CAFE; wa3 = 5'b11111; ra1 = 5'b11111;
			#2
			assert(rd1 == 64'b0);

		end
/*	
	always @ (posedge clk)
		begin
			//TEST1
			//if (i < 32)
			//	ra1 = i; ra2 = i; #2; i = i+1;
			
		end
*/		
endmodule 

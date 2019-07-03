module test_TLC();
	input TA, TB, clk, rst;
	output RA, YA, GA, RB, YB, GB;
	LFSR lfsr(clk, rst, T);
	traffic_light_controller DUT(TA, TB, clk, rst, RA, YA, GA, RB, YB, GB);
	always
		begin
			clk = 1;
			#5;
			clk = 0;
			#5;
		end
	initial
		begin
			rst = 1;
			#10;
			rst = 0;
		end
	initial
		begin
			$dumpfile ("testtlc.vcd");
			$dumpvars (0, DUT);
			for(i=0; i<20; i+=1)
			begin
				TA = lfsr.Q[0];
				TB = lfsr.Q[1];
				#10;
				$display ("TA = %b, TB = %b, RA = %b, YA = %b, GA = %b, RB = %b, YB = %b, GB = %b", TA, TB, RA, YA, GA, RB, YB, GB);
			end
			$finish
		end
endmodule

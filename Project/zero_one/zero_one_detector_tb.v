module test_zero_one();
	reg A, clk, rst;
	wire Y;
	zero_one_detector DUT(A, Y, clk, rst);
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
			$dumpfile ("test01.vcd");
			$dumpvars (0, DUT);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 0;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 0;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 0;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 0;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			A = 1;
			#10;
			$display ("Input = %b, Output = %b", A, Y);
			$finish;
		end
endmodule

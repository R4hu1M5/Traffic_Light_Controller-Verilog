module zero_one_detector(A, Y, clk, rst)
	input A, clk, rst;
	typedef enum logic [1:0] {S0, S1, S2} S;
	S [1:0] state, nextstate;
	assign S0 = 2'b00;
	assign S1 = 2'b01;
	assign S2 = 2'b10;
	output Y;
	always @(posedge clk, posedge rst)
		if(rst) state <=  S0;
		else state <= nextstate;
	always
		case(state)
			S0: if(~A) nextstate = S1;
			    else nextstate = S0;
			S1: if(~A) nextstate = S1;
			    else nextstate = S2;
			S2: if(~A) nextstate = S1;
			    else nextstate = S0;
			default: nextstate = S0;
		endcase
	assign Y = (state == S2);
endmodule

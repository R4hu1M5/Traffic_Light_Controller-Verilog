module traffic_light_controller(TA, TB, clk, rst, RA, YA, GA, RB, YB, GB)
	input TA, TB, clk, rst;
	typedef enum logic [1:0] {S0, S1, S2, S3} s;
	S [1:0] state, nextstate;
	output RA, YA, GA, RB, YB, GB;
	always @(posedge clk, posedge rst)
		if(rst) state <= S0;
		else state <= nextstate;
	always
		case(state)
			S0: if(TA) nextstate <= S0;
			    else nextstate <= S1;
			S1: nextstate <= S2;
			S2: if(TB) nextstate <= S2;
			    else nextstate <= S3;
			S3: nextstate <= S0;
			default: nextstate <= S0;
		endcase
	assign RA = (state == S2 | state == S3);
	assign YA = (state == S1);
	assign GA = (state == S0);
	assign RB = (state == S0 | state == S1);
	assign YB = (state == S3);
	assign GB = (state == S2);
endmodule

module LFSR(clk, rst, T)
	input clk, rst;
	output reg T, [4:0]  Q;
	wire feedback;
	assign feedback = ~(Q[2] ^ Q[4]);
	always @(posedge clk, posedge rst)
		begin
			if(rst)
				begin
					Q = 5'b0;
					T = 1'b0;
				end
			else
				begin
					Q = {Q[3], feedback}
					T = Q[1];
				end
		end
endmodule

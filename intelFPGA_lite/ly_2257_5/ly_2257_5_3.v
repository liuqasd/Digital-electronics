module ly_2257_5_3(Q,codeout);//译码器模块
	input [3:0] Q;//二进制输入
	output reg [6:0] codeout;//译码器输出

	always@ (Q)
		begin
			case(Q)
				4'd0: codeout = 7'b0111111;
				4'd1: codeout = 7'b0000110;
				4'd2: codeout = 7'b1011011;
				4'd3: codeout = 7'b1001111;
				4'd4: codeout = 7'b1100110;
				4'd5: codeout = 7'b1101101;
				4'd6: codeout = 7'b1111101;
				4'd7: codeout = 7'b0000111;
				4'd8: codeout = 7'b1111111;
				4'd9: codeout = 7'b1101111;
			endcase
		end
endmodule

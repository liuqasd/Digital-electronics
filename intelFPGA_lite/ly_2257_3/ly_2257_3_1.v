module ly_2257_3_1(ud,clk,clr,ld,d,Q,CO,en);
	input ud,clk,clr,ld,en;//ud加/减信号，clk时钟信号，clr清零信号，ld置数信号,en使能信号
	input [3:0] d;//置数输入
	output reg [3:0] Q;//十进制计数器输出
	output CO;//进/借位信号
	
	always@ (posedge clk,negedge clr)
		if(~clr)//clr为低电平时清零
			Q <= 4'd0;
		else if(en == 1)	
			if(ld)//ld高电平，把d赋给Q
				Q <= d;
			else if(ud)//ud高电平，加运算
				begin
					if(Q == 4'd9)
						Q <= 4'd0;
					else
						Q <= Q+4'd1;
				end
			else//ud低电平，减运算
				begin
					if(Q == 4'd0)
						Q <= 4'd9;
					else
						Q <= Q-4'd1;
				end
		assign CO = (ud & clr & Q == 4'd9)|(~ud & clr & Q == 4'd0)|(~ud & ~clr);
		//加运算时，未清零且Q为9，需要进位，CO为1
		//减运算时，未清零且Q未0，需要借位，CO为1
		//减运算时，清零，需要借位，CO为1
endmodule
module ly_2257_5_2(clk,clr,Q,CO);//十进制计数器模块
	input clk,clr;//clk时钟信号，clr清零信号
	output reg [3:0] Q;//十进制计数器输出
	output CO;//进/借位信号
	
	always@ (posedge clk,negedge clr)
		if(~clr)//clr为低电平时清零
			Q <= 4'd0;
		else
			begin
				if(Q == 4'd9)
					Q <= 4'd0;
				else
					Q <= Q+4'd1;
			end
		assign CO = (clr & Q == 4'd9);
		//加运算时，未清零且Q为9，需要进位，CO为1
endmodule

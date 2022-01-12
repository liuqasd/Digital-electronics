module ly_2257_5(clk,reset_n,key,key_state,Q,codeout,CO);
	input clk,reset_n,key;//clk为50MHZ时钟输入，reset_n为复位信号（低电平有效），key为按键输入
	output [3:0] Q;//十进制计数器输出
	output [6:0] codeout;//译码器输出
	output CO;//进位信号
	output key_state;//按键状态指示

	ly_2257_5_1 fd(clk,reset_n,key,key_state);
	ly_2257_5_2 js(key_state,reset_n,Q,CO);
	ly_2257_5_3 ym(Q,codeout);
endmodule

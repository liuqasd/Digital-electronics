module ly_2257_3(ud,clk,clr,ld,d,Q,CO,codeout,seg,en);
	input ud,clk,clr,ld,en;//ud加/减信号，clk时钟信号，clr清零信号，ld置数信号,en使能信号
	input [3:0] d;//置数输入
	output [3:0] Q;//十进制计数器输出
	output [6:0] codeout;//译码器输出
	output CO;//进位信号
	output seg;
	ly_2257_3_1 js(ud,clk,clr,ld,d,Q,CO,en);
	ly_2257_3_2 ym(Q,codeout,seg);
endmodule
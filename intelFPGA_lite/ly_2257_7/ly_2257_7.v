module ly_2257_7(clk_in,rst,auto,Key,clk_out,clk_out2,codeout,low,middle);
input 		clk_in;//时钟信号输人
input 		rst;//复位信号
input			auto;//自动播放控制按钮
input [13:0]Key;
output wire [7:0]	codeout; //数码管显示
output wire	clk_out;		//分频后输出信号
output wire clk_out2;	//输出频率
output wire [6:0]low;
output wire [6:0]middle;

ly_2257_7_3 play(
	.clk_in(clk_in),
	.rst(rst),
	.auto(auto),
	.Key(Key) ,
	.clk_out(clk_out),
	.codeout(codeout),
	.low(low),
	.clk_out2(clk_out2),
	.middle(middle)
);
endmodule

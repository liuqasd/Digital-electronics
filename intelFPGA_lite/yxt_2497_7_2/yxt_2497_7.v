module yxt_2497_7(clk_in,rst,auto,Key,clk_out,codeout,beep,low,middle);
input 		clk_in;//时钟信号输人
input 		rst;//复位信号
input			auto;//自动播放控制按钮
input [13:0]Key;
output wire [7:0]	codeout; //数码管显示
output wire	clk_out;//分频后输出信号

output wire beep;
output wire [6:0]low;
output wire [6:0]middle;

yxt_2497_7_3 play(
						.clk_in(clk_in),
						.rst(rst),
						.auto(auto),
						.Key(Key) ,
						.clk_out(clk_out),
						.codeout(codeout),
						.low(low),
						.beep(beep),
						.middle(middle)
						);
endmodule

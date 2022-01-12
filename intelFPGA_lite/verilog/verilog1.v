`timescale 10ns / 1ns
module verilog1();

reg clk_in; //输入
reg rst;
reg sel;
wire clk_out; //输出

initial //初始化
begin
   clk_in = 1'b0;
	sel = 1'b0;
	rst = 1'b0;
	#100
	rst = 1'b1;
	#200000
	sel = 1'b1;
end

always #1 clk_in = ~clk_in; //设置clk_in频率

verilog divider(
   .clk_in (clk_in),
	.rst    (rst),
	.sel    (sel),
	.clk_out(clk_out)
);

endmodule
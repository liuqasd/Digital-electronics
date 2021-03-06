`timescale 10ns/1ns
module test_;
reg clk_in;
reg sel;
wire clk_out,out1,out2;
wire [15:0] CO1;
wire [15:0] CO2;
initial
begin
	clk_in=0;
	sel=0;
end
always#1 clk_in=~clk_in;
always#100000 sel=~sel;

test test(
	.clk_in(clk_in),
	.sel(sel),
	.clk_out(clk_out),
	.CO1(CO1),
	.CO2(CO2),
	.out1(out1),
	.out2(out2)
);
endmodule



//`timescale 1ns / 1ns
module test_ly_2257_4();
	reg clk_in;//输入
	reg rst_n;
	reg sel;
	wire clk_out;//输出
	
	parameter T = 20;
	
	initial begin	//初始化 系统复位
			clk_in = 0;
			rst_n = 0;
			sel = 1;
			#50	//等待50ns
			rst_n = 1;
			#400000
			sel = 0;
		end
		
	always #(T/2) clk_in = ~clk_in;

	ly_2257_4 divider(	//例化
		.clk_in       (clk_in),
		.sel          (sel),
		.rst_n        (rst_n),
		.clk_out      (clk_out)
	);
endmodule
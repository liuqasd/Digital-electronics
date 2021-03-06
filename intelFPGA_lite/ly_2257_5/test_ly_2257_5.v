`timescale 1ns / 1ns   //1ns->10ns
module test_ly_2257_5();
	// 输入
	reg clk;
	reg reset_n;
	reg key;
	// 输出
	wire key_state;
	wire [3:0]Q;
	wire [6:0]codeout;
	wire CO;
 
	ly_2257_5 test (
		.clk(clk), 
		.reset_n(reset_n), 
		.key(key),  
		.key_state(key_state),
		.Q(Q),
		.codeout(codeout),
		.CO(CO)
	);
	
	always #1 clk = ~clk;
		initial 
			begin
				//初始化
				clk = 1'b0;
				reset_n = 1'b0;
				key = 1'b1;
		 
				#200;
				reset_n = 1'b1;//拉高reset_n，结束复位
			end
		
		always 
			begin
				//抖动
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				//稳定
				#(40*100000);
				key = 1'b1;
				//抖动
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				#100000;
				key = 1'b0;
				#100000;
				key = 1'b1;
				//稳定
				#(40*100000);
				key = 1'b0;
			end	      
endmodule

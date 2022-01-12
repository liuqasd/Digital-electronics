module verilog(clk_in, rst, sel, clk_out);
input clk_in; //输入
input rst;    //清零信号
input sel;    //控制信号
output clk_out; //输出
reg clk_out;

parameter NUM_OUT1 = 50000000 / 2257; //赫兹转纳秒
parameter NUM_OUT2 = 50000000 / 12257;
reg[15:0] sn;

always@(posedge clk_in or negedge rst)
   if (!rst) //rst为低电平时clk_out置为0
	begin
	   sn <= 16'd0;
		clk_out <= 1'b0;
	end      //sel为1时输出学号后五位，为0时输出学号后四位，占空比为20%
	else if ((sn < NUM_OUT1 / 5 & !sel) | (sn < NUM_OUT2 / 5 & sel))
	begin
	   sn <= sn + 16'd1; //计数，clk_out高电平
		clk_out <= 1'b1;
	end
	else if ((sn < NUM_OUT1 - 1 & !sel) | (sn < NUM_OUT2 - 1 & sel))
	begin
	   sn <= sn + 16'd1; //计数，clk_out低电平
		clk_out <= 1'b0;
	end
	else
	   sn <= 16'd0;
endmodule
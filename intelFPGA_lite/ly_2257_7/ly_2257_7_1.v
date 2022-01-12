module ly_2257_7_1(clk_in,rst,clk_div);  //分频器模块

parameter NUM_DIV = 2;     //对时钟分频

input       clk_in;        //时钟信号  
input       rst;
output reg  clk_div;       //分频后输出信号

reg [19:0]  count;         //分频计数器

always@(posedge clk_in or negedge rst)
begin
	if(!rst)
		begin
			count   <= 0;
			clk_div <= 0;
		end
	else
		begin
			if(count >= NUM_DIV)
			begin
				clk_div <= !clk_div;
				count   <= 0;
			end
			else
				count   <= count + 1;
		end
end

endmodule

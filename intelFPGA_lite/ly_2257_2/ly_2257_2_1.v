module ly_2257_2_1(clk,en,Q);//计数器
input clk,en;   //输入时钟和使能
output reg[2:0] Q;  //计数器输出
always@(posedge clk) //时钟上升沿执行
begin
	if(en == 1'b1)  //使能端处于高电平自加
	begin
		if(Q < 3'd6)
		Q <= Q + 1'b1;
		else
		Q <= 0;
	end
	else
		Q <= Q;  
end
endmodule
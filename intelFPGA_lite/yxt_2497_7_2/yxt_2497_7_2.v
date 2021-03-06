module yxt_2497_7_2(clk_in,Key,codeout);  //数码管显示模块

input clk_in;        //时钟信号
input [13:0] Key;    //用户按键信号
output reg [7:0] codeout;

always@ (clk_in or Key)
begin
	     if(Key[0] == 1)
				codeout = 8'b0000_0110;    //1
	else if(Key[1] == 1)
				codeout = 8'b0101_1011;    //2
	else if(Key[2] == 1)
				codeout = 8'b0100_1111;    //3
	else if(Key[3] == 1)
				codeout = 8'b0110_0110;    //4
	else if(Key[4] == 1)
				codeout = 8'b0110_1101;    //5
	else if(Key[5] == 1)
				codeout = 8'b0111_1100;    //6
	else if(Key[6] == 1)
				codeout = 8'b0000_0111;    //7
	else if(Key[7] == 1)
				codeout = 8'b1000_0110;    //1.
	else if(Key[8] == 1)
				codeout = 8'b1101_1011;    //2.
	else if(Key[9] == 1)
				codeout = 8'b1100_1111;    //3.
	else if(Key[10] == 1)
				codeout = 8'b1110_0110;    //4.
	else if(Key[11] == 1)
				codeout = 8'b1110_1101;    //5.
	else if(Key[12] == 1)
				codeout = 8'b1111_1100;    //6.
	else if(Key[13] == 1) 
				codeout = 8'b1000_0111;    //7.
	else    
         	codeout = 8'b0011_1111;	   //0
end
endmodule

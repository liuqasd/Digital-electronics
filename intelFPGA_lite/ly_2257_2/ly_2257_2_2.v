module ly_2257_2_2(Q,codeout); //译码器
input [2:0]Q;  //译码器输入接收计数器输出
output reg[6:0]codeout; //译码器输出
always@(Q)
begin
	case(Q)
	3'd0:codeout <= 7'b000_0000;  //Q为0	点亮a管
	3'd1:codeout <= 7'b000_0001;  //Q为1	点亮b管
	3'd2:codeout <= 7'b000_0011;	//Q为2	点亮c管
	3'd3:codeout <= 7'b000_0111;	//Q为3	点亮d管
	3'd4:codeout <= 7'b000_1111;	//Q为4	点亮e管
	3'd5:codeout <= 7'b001_1111;	//Q为5	点亮f管
	3'd6:codeout <= 7'b011_1111;	//Q为6	不亮
	default:codeout <=7'bx;
	endcase
end
endmodule
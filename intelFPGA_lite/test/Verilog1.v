module ly_2257_1(din,dout,seg);
input[3:0] din;
output[7:0] dout;
reg[7:0] dout;//定义同名寄存器
output seg;
assign seg = 1'b1;	//数码管使能（位选信号）
always@(din)
begin
	case(din)
		4'b0000:dout <=8'b00000000; //0
		4'b0001:dout <=8'b00000001; //1
		4'b0010:dout <=8'b00000010; //2
		4'b0011:dout <=8'b00000100; //3
		4'b0100:dout <=8'b00001000; //4
		4'b0101:dout <=8'b00010000; //5
		4'b0110:dout <=8'b00100000; //6
		4'b0111:dout <=8'b01000000; //7
		4'b1000:dout <=8'b10000000; //8
		4'b1001:dout <=8'b00000011; //9
		4'b1010:dout <=8'b00000111; //10
		4'b1011:dout <=8'b00001111; //11
		4'b1100:dout <=8'b00011111; //12
		4'b1101:dout <=8'b00111111; //13
		4'b1110:dout <=8'b01111111; //14
		4'b1111:dout <=8'b11111111; //15
		default:dout <=8'd0;
	endcase
end
endmodule
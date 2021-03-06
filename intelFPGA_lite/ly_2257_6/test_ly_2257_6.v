`timescale 100us/1us //0.1ms一个单位 1kHz~1ms~10
module test_ly_2257_6;
reg Ain,Bin,rst,clkin;
wire [3:0]cnt;
wire [6:0]codeout;
wire A;
wire B;

initial 
begin
	Ain = 0;
	Bin = 0;
	rst = 0;
	clkin = 0;
	#10
	rst = 1;
end

always #5 clkin <= ~clkin;

always 
begin
	#400
	Ain = 0;
	
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	
	#200
	Ain = 1;
	#200
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;	
	
	#600
	Ain = 0;
	
	#400
	Ain = 0;
	
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	
	#200
	Ain = 1;
	#200
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;	
	
	#600
	Ain = 0;

//减计数	
	#600
	Ain = 0;
	
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	#10
	Ain = 0;
	#10
	Ain = 1;
	
	#200
	Ain = 1;
	#200
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;
	#10
	Ain = 1;
	#10;
	Ain = 0;	
	
	#400
	Ain = 0;	
end

always 
begin
	#600
	Bin = 0;
	
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;

	#200
	Bin = 1;
	#200
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	
	#400
	Bin = 0;
	#600
	Bin = 0;
	
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;

	#200
	Bin = 1;
	#200
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	
	#400
	Bin = 0;
	
	//减计数
	#400
	Bin = 0;
	
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;

	#200
	Bin = 1;
	#200
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	#10
	Bin = 1;
	#10
	Bin = 0;
	
	#600
	Bin = 0;
end

ly_2257_6 test(
	.Ain		(Ain),
	.Bin		(Bin),
	.clkin	(clkin),
	.rst		(rst),
	.cnt		(cnt),
	.codeout (codeout),
	.A(A),
	.B(B)
	);

endmodule

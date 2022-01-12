`timescale 1ns/1ns

module test_yxt_2497_7();

reg          clk_in;
reg          rst;
reg          auto;
reg  [13:0]  Key;

wire        clk_out;
wire        beep;
wire [7:0]  codeout;
wire [6:0]  low;
wire [6:0]  middle;  

yxt_2497_3 play(
						.clk_in(clk_in),
						.rst(rst),
						.auto(auto),
						.Key(Key),
						.clk_out(clk_out),
						.beep(beep),
						.codeout(codeout),
						.low(low),
						.middle(middle)
					  );				
				
initial clk_in = 1;
always # 500 clk_in = ~clk_in; //时钟频率1MHZ

initial
begin
	rst  = 0;
	auto = 0;
	Key  = 14'b0;
	#(1000)
	rst  = 1;
	#(10000*1000);
	repeat(3)      //每次按下按键10ms
	begin
	Key  = 14'b000_0000_000_0001;
	#(10000*1000)               
	Key  = 14'b000_0000_000_0010;
	#(10000*1000)
	Key  = 14'b000_0000_000_0100;
	#(10000*1000)
	Key  = 14'b000_0000_000_1000;
	#(10000*1000)
	Key  = 14'b000_0000_001_0000;
	#(10000*1000)
	Key  = 14'b000_0000_010_0000;
	#(10000*1000)
	Key  = 14'b000_0000_100_0000;
	#(10000*1000)
	Key  = 14'b000_0001_000_0000;
	#(10000*1000)
	Key  = 14'b000_0010_000_0000;
	#(10000*1000)
	Key  = 14'b000_0100_000_0000;
	#(10000*1000)
	Key  = 14'b000_1000_000_0000;
	#(10000*1000)
	Key  = 14'b001_0000_000_0000;
	#(10000*1000)
	Key  = 14'b010_0000_000_0000;
	#(10000*1000)
	Key  = 14'b100_0000_000_0000;
	end
end

endmodule

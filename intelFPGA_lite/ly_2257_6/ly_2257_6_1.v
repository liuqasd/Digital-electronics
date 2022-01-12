module ly_2257_6_1(Ain,Bin,rst,clkin,cnt,A,B);

input Ain;
input Bin;
input clkin;
input rst;

output reg [3:0]cnt;

output reg A;
output reg B;

	wire Apedge,Anedge,entcnt,entcnt1;

	reg [3:0]tcnt;
	reg tcnt_full;

	reg [3:0]tcnt1;
	reg tcnt1_full;

	reg A_reg0,A_reg1;//reg0 是最新数值 reg1是上一时刻数值 
	reg B_reg0,B_reg1;
	reg Ain_reg0,Ain_reg1;
	reg Bin_reg0,Bin_reg1;

	parameter MAXN = 4'd10;//1ms -->10ms

//AB直接输入的分时缓存
always @(posedge clkin or negedge rst)
begin
	if(!rst)
	begin
		Ain_reg0 <= 0;
		Ain_reg1 <= 0;
		Bin_reg0 <= 0;
		Bin_reg1 <= 0;
	end
	else
	begin
			Ain_reg0 <= Ain;
			Ain_reg1 <= Ain_reg0;
			Bin_reg0 <= Bin;
			Bin_reg1 <= Bin_reg0;
	end
end

assign entcnt  = Ain_reg0 ^ Ain_reg1; //A消抖计数使能
assign entcnt1 = Bin_reg0 ^ Bin_reg1; //B消抖计数使能

//消抖计数A
always @(posedge clkin or negedge rst)
begin
	if(!rst)
	begin
		tcnt <= 0;
		tcnt_full <= 0;
	end
	else 
	begin
		if(entcnt)
		begin
			tcnt <= 0;
			tcnt_full <= 0;
		end
		else if(tcnt < MAXN)
			tcnt <= tcnt + 1;
		else if(tcnt == MAXN)
		begin
			tcnt <= tcnt + 1;
			tcnt_full <= 1;
		end
		else
		begin
			tcnt <= tcnt;
			tcnt_full <= 0;
		end
	end
end

//消抖计数B
always @(posedge clkin or negedge rst)
begin
	if(!rst)
	begin
		tcnt1 <= 0;
		tcnt1_full <= 0;
	end
	else 
	begin
		if(entcnt1)
		begin
			tcnt1 <= 0;
			tcnt1_full <= 0;
		end
		else if(tcnt1 < MAXN)
			tcnt1 <= tcnt1 + 1;
		else if(tcnt1 == MAXN)
		begin
			tcnt1 <= tcnt1 + 1;
			tcnt1_full <= 1;
		end
		else
		begin
			tcnt1 <= tcnt1;
			tcnt1_full <= 0;
		end
	end
end

//消抖输入A
always @(posedge clkin or negedge rst)
begin
	if(!rst)
		A <= 0;
	else
		if(tcnt_full)
			A <= Ain_reg1;
		else
			A <= A;
end

//消抖输入B
always @(posedge clkin or negedge rst)
begin
	if(!rst)
		B <= 0;
	else
		if(tcnt1_full)
			B <= Bin_reg1;
		else
			B <= B;
end

//缓存A B数值;
always @(posedge clkin or negedge rst)
begin
	if(!rst)
	begin
		A_reg0 <= 1'b0;
		A_reg1 <= 1'b0;
		B_reg0 <= 1'b0;
		B_reg0 <= 1'b0;
	end
	else
	begin
		A_reg0 <= A;
		A_reg1 <= A_reg0;
		B_reg0 <= B;
		B_reg1 <= B_reg0;
	end
end

assign Apedge = A_reg0 & (!A_reg1);//上升沿 A_reg0 == 1,A_reg1 == 0;
assign Anedge = (!A_reg0) & A_reg1;//下降沿 A_reg0 == 0,A_reg1 == 1;

//计数器模块
always @(posedge Apedge or negedge rst)
begin
	if(!rst)	cnt <= 0;
	else
	begin
		if(B_reg0 == 1'b0)
		begin
			if(cnt < 4'd9)
				cnt <= cnt + 1'b1;
			else if(cnt == 4'd9)
				cnt <= cnt;
			else
				cnt <= 0;
		end
		else
		begin
			if(cnt > 4'd0)
				cnt <= cnt - 1;
			else if(cnt == 1'b0)
				cnt <= cnt;
			else 
				cnt <= 0;
		end
	end
end
	
endmodule
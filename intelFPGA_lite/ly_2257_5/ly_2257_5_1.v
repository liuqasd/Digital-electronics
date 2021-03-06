module ly_2257_5_1(clk,reset_n,key,key_state);//按键防抖动模块
	input clk,reset_n,key;//clk为50MHz时钟信号，reset_n低电平清零，key按键输入
	output key_state;//输出按键当前状态

	reg cnt_en;    //计数器使能
	reg [20:0] cnt;//计数器
	reg [3:0] state;//状态信号
	reg key_state;
	
	parameter key0 = 4'b0001;//松开稳定状态
	parameter key1 = 4'b0010;//按下毛刺状态
	parameter key2 = 4'b0100;//按下稳定状态
	parameter key3 = 4'b1000;//松开毛刺状态

	always@(posedge clk,negedge reset_n)//计数器
		begin
		  if(!reset_n) 
				cnt <= 0;//reset_n低电平，清零
		  else if(cnt_en) 
				cnt <= cnt + 1'b1;//计数
		  else 
				cnt <= 0;
		end
	
	always@(posedge clk,negedge reset_n)//主要逻辑
		begin
		  if(!reset_n)//reset_n低电平，重置为初始状态
				begin
				 state <= key0;
				 cnt_en <= 0;
				 key_state <= 0;
				end
			else 
				begin
					case(state)
						key0://松开稳定状态
							begin
								key_state <= 1'b0;//松开按键输出0
								if(key==1&&cnt_en==0) //按键输入1，开始判断是否为毛刺
									begin
										state <= key1;//计入按下毛刺状态
										cnt_en <= 1'b1;//计数器开始工作
									end
								else
									state <= key0;//其他情况仍然为当前状态
							end
						key1://按下毛刺状态
							begin
								key_state <= 1'b0;//按下按键毛刺状态输出0
//时间单位为10，时钟周期为20，假设抖动不超过10ms，计数50w次即可计时10ms
								if(cnt >= 21'd150_0000&&key==1) 
//计时结束，仍然输入1，进入按下稳定状态
									begin
										state <= key2;//进入按下稳定状态
										cnt_en <= 1'b0;//计数器停止工作
									end
								else if (cnt >= 21'd150_0000&&key==0)
//计时结束，输入为1，回到松开稳定状态
									begin
										state <= key0;//进入松开稳定状态
										cnt_en <= 1'b0;//计数器停止工作
									end
								else 
									state <= key1;//计数未结束，保持当前状态
							end
						key2://按下稳定状态
							begin
								key_state <= 1'b1;//按下按键稳定状态输出1
								if(key==0&&cnt_en==0) 
//输入为0，且不在计时状态，进入松开毛刺状态
									begin
										state <= key3;//进入松开毛刺状态
										cnt_en <= 1'b1;//计数器开始工作
									end
								else 
									state <= key2;//其他情况仍然为当前状态
							end
						key3://松开毛刺状态
							begin
								key_state <= 1'b1;//松开按键毛刺状态输出1
								if(cnt >= 21'd150_0000&&key==0) 
//计时结束，仍然输入0，进入松开稳定状态
									begin
										state <= key0;//进入松开稳定状态
										cnt_en <= 1'b0;//计数器停止工作
									end
								else if (cnt >= 21'd150_0000&&key==1)
//计时结束，输入为1，回到按下稳定状态
									begin
										state <= key2;//进入按下稳定状态
										cnt_en <= 1'b0;//计数器停止工作
									end
								else 
									state <= key3;//其他情况仍然为当前状态
							end
						
					default:
						state <= key0;//默认为松开稳定状态
				endcase
			end
		end
endmodule

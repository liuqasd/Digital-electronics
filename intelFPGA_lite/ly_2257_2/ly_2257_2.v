module ly_2257_2(clk,en,Q,codeout); //彩灯控制器
input clk,en;
output [2:0] Q;  //计数器输出
output [6:0] codeout;  //译码器输出
ly_2257_2_1 a(clk,en,Q);  //调用计数器子模块
ly_2257_2_2 b(Q,codeout); //调用译码器子模块
endmodule
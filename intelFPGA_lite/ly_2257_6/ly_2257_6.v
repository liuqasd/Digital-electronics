module ly_2257_6(Ain,Bin,clkin,rst,cnt,codeout,A,B);

input Ain;
input Bin;
input clkin;
input rst;
output A;
output B;
output [3:0]cnt;
output [6:0]codeout; 
	ly_2257_6_1 ly6_1(Ain,Bin,rst,clkin,cnt,A,B);
	ly_2257_6_2 ly6_2(cnt,codeout);
endmodule
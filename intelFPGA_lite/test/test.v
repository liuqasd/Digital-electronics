module test(clk,en,q,codeout);
input clk,en;
output [2:0] q;
output [6:0] codeout;
test_1 a(clk,en,q);
test_2 b(q,codeout);
endmodule
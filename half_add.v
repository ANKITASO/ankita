`timescale 1ns / 1ps
module half_add(
    input a,b,
    output  s,c
    );
assign s = a ^ b;       
assign c = a & b;
endmodule
 
module fa
(input a, b, cin,
output sum,c   
);
wire t1, t2, t3;
half_add h1(.a(a), .b(b), .s(t2), .c(t1));
half_add h2(.a(t2), .b(cin), .s(sum), .c(t3));
assign c = t1 | t3;
endmodule 



module carry_add(
input [3:0] a,b,
input cin,
output [3:0]sum,
output cout
);
wire t0,t1,t2;
fa f0(a[0], b[0], cin, sum[0],t0);  
fa f1(a[1], b[1], t0, sum[1],t1);
fa f2(a[2], b[2], t1, sum[2],t2);
fa f3(a[3], b[3], t2, sum[3],cout);
endmodule
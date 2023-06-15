`timescale 1ns / 1ps



module jhonson(
    input clk,rst,d,
    output reg q
);
always@(posedge clk)
begin
if( rst == 1)
begin
q <= 1'b0;
end      
else
q <= d;   
end
endmodule


module jhonson_4(
input clk ,rst,
output reg [3:0]qj
);
wire t0,t1,t2,t3;
jhonson j3(clk, rst, ~t0, t3);
jhonson j2(clk, rst, t3, t2);
jhonson j1(clk, rst, t2, t1);
jhonson j0(clk, rst, t1, t0);
assign t3 = qj[3];
assign t2 = qj[2];
assign t1 = qj[1];
assign t0 = qj[0];
endmodule



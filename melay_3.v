`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2023 13:09:32
// Design Name: 
// Module Name: melay_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module melay_3(
    input clk,rst,din,
    output  reg dout
    );
parameter idle = 0;
parameter s0= 1;
parameter s1 = 2;
reg [1:0] s = idle ,ns = idle;
always@(posedge clk)
begin
if (rst)
 s <= idle;
else 
 s <= ns;
end
always@(s,din)
begin
case(s)
idle:begin
dout = 1'b0;
end
s0 :begin
if(din)
 dout = 1'b1;
else 
 dout = 1'b0;
end
s1 :begin
dout = 1'b0;
end
default: dout  = 1'b0;
endcase
end
always@(s,din)
begin
case(s)
idle: begin
if(rst)
 ns = idle;
else 
 ns = s0;
end
s0:begin
if(din)
 ns = s1;
else 
 ns = s0;
end
s1:begin
if(din)
 ns = s0;
else 
 ns = s1;
end
endcase
end
endmodule

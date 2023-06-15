`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 23:34:31
// Design Name: 
// Module Name: moore_2
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


module moore_2(
    input clk,rst,din,
    output  reg dout
    );
parameter idle = 0;
parameter s0 = 1;
parameter s1 = 2;
reg [1 : 0] s = idle,ns = idle;
always@(posedge clk)
begin
if (rst == 1'b1)
 s <= idle;
else 
 s <= ns;
end
always@(s,din)  
begin
case(s)  
idle:begin
dout = 1'b0;
if(rst == 1'b1)
 ns = idle;
else 
 ns = s0;
end
s0:begin
dout = 1'b0;
if (din == 1'b1)
 ns = s1;
else 
 ns = s1;
end
s0:begin
dout = 1'b1;
if (din == 1'b1)
 ns = s0;
else 
 ns = s1;
end
default : ns = idle;
endcase
end
endmodule
 
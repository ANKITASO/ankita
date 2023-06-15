`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2023 20:06:55
// Design Name: 
// Module Name: moore_1
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


module moore_1(
    input clk,rst,din,
    output reg  do
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
idle : do = 1'b0;
s0: do = 1'b0;
s1: do = 1'b1;
default : do = 1'b0;
endcase
end  
always@(s,din)
begin
case(s)
idle : begin
    ns = s0;
end
 
s0: begin
  if(din == 1'b1)
     ns = s1;
   else
     ns = s0;
end
 
 
s1 : begin
  if(din == 1'b1)
    ns = s0;
  else
    ns = s1;
end
 
default : ns = idle; 
 
endcase
end   
endmodule

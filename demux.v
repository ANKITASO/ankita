`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2023 19:52:21
// Design Name: 
// Module Name: demux
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


module demux(
    input din,
    input [1:0] s,
    output reg  [0:3] dout
    );
always@(s)
begin
case(s)
2'b00: dout = 4'b1000;
2'b01: dout = 4'b0100;
2'b10: dout = 4'b0010;
2'b11: dout = 4'b0001;
default: dout = 4'b0000;
endcase
end
endmodule

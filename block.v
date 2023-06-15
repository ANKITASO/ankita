`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 23:39:50
// Design Name: 
// Module Name: block
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


module block(
    input clk1,clk2,
    input [7:0] add1,
    output [7:0] dout1,
    input [7:0] add2,
    output [7:0] dout2
    );
blk_mem_gen_0(clk1,add1,dout1,clk2,add2,dout2);
endmodule

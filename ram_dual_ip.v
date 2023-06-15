`timescale 1ns / 1ps

module ram_dual_ip(
    input clka,clkb,
    input ena,enb,
    input wr,
    input [7:0]adda,addb,
    input [7:0] din,
    output [7:0] dout
    );
blk_mem_gen_0 b1(clka,ena,wr,adda,din,clkb,enb,addb,dout);
endmodule

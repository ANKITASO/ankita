`timescale 1ns / 1ps

// 64 x 8 bit ram
module ram_1(
input clk, rst, wr,
input [5:0] address,
input [7:0] din,
output  reg [7:0] dout
);
reg [7:0] mem [63:0];
integer i = 0;
always@(posedge clk)
begin
  if(rst)
    begin
     for (i = 0; i < 64;  i = i+1)
      begin
        mem [i] <= 8'h00;
      end
     dout <= 8'h00;
    end
  else
    begin
      if(wr == 1'b1)
       begin
         mem [address] <= din;
       end
      else begin
          dout <= mem[address];
        end
    end
end
endmodule

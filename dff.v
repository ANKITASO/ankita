`timescale 1ns / 1ps


module dff(
    input clk,rst,d,
    output reg Q
    );
always@(posedge clk or posedge rst)
begin
if(rst == 1'b1)
  begin
     Q <= 1'b0;
  end
else begin
    Q <= d; 
  end
end
endmodule

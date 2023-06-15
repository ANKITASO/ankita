`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2023 14:30:25
// Design Name: 
// Module Name: melay_1
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


module melay_1(
    input clk,rst,din,
    output  reg dout
    );
parameter idle = 0;
parameter s0 = 1;
parameter s1 = 2;
reg [1:0] s = idle;
always@(posedge clk)
begin
   if(rst)
     begin
     s <= idle;
     dout <= 1'b0;
     end
else 
 begin
 case(s)
 idle: begin
  dout <= 1'b0;
  s <= s0;
  end
 s0: begin 
  if(din)
    begin
    dout   <= 1'b1;
    s  <= s1; 
    end
  else
    begin
    dout  <= 1'b0;
    s <= s0;
    end 
   end
                 
 s1: 
 begin
 if(din)
   begin
   dout   <= 1'b0;
   s <= s0; 
   end
 else
   begin
   dout  <= 1'b0;
   s <= s1;
   end 
 end
                 
 default: 
 begin
 s  <= idle;
 dout   <=  1'b0;
 end
                 
 endcase
 end           
end
 
endmodule

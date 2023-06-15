`timescale 1ns / 1ps

module ram_dual(
    input clka, clkb,
    input  ena, enb, wr,
    input [7:0] adda,
    input [7:0] addb,
    input [7:0] in_a,
    input [7:0] in_b,
    output reg [7:0] out_a,
    output reg [7:0] out_b
    );
reg [7:0] mema [255:0];
reg [7:0] memb [255:0];
always @(posedge clka)
begin
  if (ena)
   begin
     if (wr) begin
       mema[adda] <= in_a;
     end
     else begin
      out_a <= mema[adda];
     end
  end
end

always @(posedge clkb)
begin
  if (enb)
   begin
     if (wr) begin
       memb[addb] <= in_b;
     end
     else begin
      out_b <= memb[addb];
     end
  end
end
endmodule

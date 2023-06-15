`timescale 1ns / 1ps

module fifo_sy(
input clk,rst ,wr_en,rd_en,
input[7:0] buf_in,
output buf_empty,buf_full,
output reg [7:0]buf_out,
output reg[7:0] fifo_counter
);
reg [7:0] mem[63:0];
reg rd_pt, wr_pt;
reg buf_empty ,buf_full;
always@(fifo_counter)
begin
  buf_empty = (fifo_counter == 0);
  buf_full = (fifo_counter == 64);
end
always@(posedge clk or negedge rst )
begin
  if (!rst)
    fifo_counter <= 0;
  else if (!buf_full && wr_en)
    fifo_counter <=fifo_counter + 1;
  else if (!buf_empty && rd_en)
    fifo_counter <=fifo_counter - 1;
  else 
    fifo_counter <= fifo_counter;
end
always@(posedge clk  or negedge rst)
begin
 if(!rst)
   buf_out <= 0;
 else  
  begin
    if(!buf_empty && rd_en)
      buf_out <= mem[rd_pt];
    else 
      buf_out <= buf_out;
  end
end
always@(posedge clk   )
begin
  if(!buf_full && wr_en)
    mem[wr_pt] <= buf_in;
  else 
    mem[wr_pt] <= mem[wr_pt];
end
always@(posedge clk or negedge rst )
begin
 if(!rst)begin
   wr_pt <= 0;
   rd_pt <= 0;
   end
 else
 begin
   if(!buf_full && wr_en)
     wr_pt <= wr_pt + 1;
   else 
     wr_pt <= wr_pt;
   if (!buf_empty && rd_en)  
     rd_pt <= rd_pt + 1;
   else 
     rd_pt <= rd_pt;
 end
end
endmodule

`timescale 1ns / 1ps

module uart(
input clk,start,
input [7:0] txin,
input rx,
output reg tx,
output rxdone,txdone,
output [7:0] rxout
    );
 parameter clk_value = 1000000;
 parameter baud = 9600;
 parameter wait_count = clk_value / baud ;   
 reg clk_tmp = 0;
 integer count = 0;
 parameter idle = 0, send = 1, check = 2;
 reg [1:0] state = idle;
 always@(posedge clk)
 begin 
  if(state == idle)
    begin
    count <= 0 ;
    end
  else 
    begin
      if(count == wait_count / 2)
      begin
        count = 0;
        clk_tmp <= ~ clk_tmp;
      end
    else
      begin
      count = count+1;
      end
    end
end


reg [9:0] txdata;
reg [9:0] shiftx;
integer bitindex = 0;
always@(posedge clk)
begin
case(state)
idle:
  begin
    tx <= 1'b1;
    txdata <= 0;
    shiftx <= 0;
    bitindex = 0;
    if(start == 1'b1)
      begin
       txdata <= {1'b1 & txin & 0'b1};
       state <= send;
      end
    else 
      begin
        state <= idle;
      end
   end 
send:
  begin
    tx <= txdata[bitindex];
    state <= check;
    shiftx <= {txdata[bitindex] & shiftx[9:1]};
  end
check:
  begin
    if(bitindex <= 9)
      begin
        state <= send;
        bitindex = bitindex + 1;
      end
    else
    begin
      state <= idle;
      bitindex = 0;
    end
  end
default: state <=idle;
endcase
end
assign txdone = (bitindex == 9 ) ? 1'b1 : 1'b0;
 
integer rcount = 0;
integer rindex = 0;
parameter ridle = 0, rrec = 1, rwait = 2, rcheck= 3;
reg [1:0]rstate;
reg [9:0] rxdata;
always@(posedge clk)
begin
case(rstate)
ridle:
begin
  rcount = 0;
  rindex = 0;
  rxdata <= 0;
  if(rx == 1'b1)
    begin
      rstate <= rwait;
    end
  else begin
    rstate <= ridle;
    end
end
rwait:
begin
  if(rcount < wait_count / 2)
    begin
      rcount = rcount +1;
      rstate <= rwait;
    end
  else
    begin
      rcount = 0;
      rstate <=rrec;
      rxdata <= {rx,rxdata[9:1]}; 
    end
end
rrec:
begin
  if(rindex < 9)
  begin
    rindex <= rindex + 1;
    rstate <= rwait;
  end
  else
  begin
    rstate <= ridle;
    rindex <= 0;
  end
end
default: rstate <=  ridle;
endcase
end 
assign rxout = rxdata[8:1]; 
assign rxdone = (rindex == 9 ) ? 1'b1 : 1'b0;
endmodule

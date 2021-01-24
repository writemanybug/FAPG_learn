module xsfebpin(clk_in,rst,clk_out);
input clk_in,rst;
output reg clk_out;
reg [3:0] cnt1,cnt2;
always @(posedge clk_in or posedge rst)
begin
 if(rst)
   begin
  cnt1<=0;
  cnt2<=0;
  clk_out<=0;
 end
 else if(cnt1<8)   //9次5分频,9=a;
 begin 
  if(cnt2<4)     //5
  begin
   cnt2<=cnt2+1;
   clk_out<=0;
  end
  else 
  begin
   cnt2<=0;
   cnt1<=cnt1+1;
   clk_out<=1;
  end
 end
 else 
 begin
  if(cnt2<7)   //1次8分频
  begin
   cnt2<=cnt2+1;
   clk_out<=0;
  end
  else
  begin
   cnt2<=0;
   cnt1<=0;
   clk_out<=1;
  end
 end
end

endmodule
`timescale  1us/1us  
module stopwatch_test;
  reg clk,rst;
  wire[7:0] sout ;
  wire[7:0] mout;
  wire[7:0] hout;
  stopwatch u1(clk,rst,sout,mout,hout);
  always #20 clk=~clk;
  initial
    begin
      clk=0;rst=0;
      #50 rst=1;
      #600000 $stop;
    end
  initial $monitor($time, , ,"clk=%d rst=%d sout=%d mout=%d hout=%d",clk,rst,sout,mout,hout);
endmodule
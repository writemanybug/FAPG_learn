`timescale  1us/1us  
module stop_test;
  reg clk,rst;
  wire[7:0] out ;
  wire[7:0] out1;
  stop u1(clk,rst,out,out1);
  always #20 clk=~clk;
  initial
    begin
      clk=0;rst=0;
      #50 rst=1;
      #6000 $stop;
    end
  initial $monitor($time, , ,"clk=%b rst=%b out=%b out1=%b",clk,rst,out,out1);
endmodule

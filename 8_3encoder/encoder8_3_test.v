`timescale  1us/1us 
module encoder8_3_test();
  wire[2:0] out ;
  reg[7:0] ina;
  encoder8_3 u1(ina,out);
  initial
    begin
      ina=8'b00000000;
      #50 ina=8'b10000000;
      #50 ina=8'b01000000;
      #50 ina=8'b00100000;
      #50 ina=8'b00010000;
      #50 ina=8'b00001000;
      #50 ina=8'b00000100;
      #50 ina=8'b00000010;
      #50 ina=8'b00000001;
      #1000 $stop;
    end
  initial $monitor($time, , ,"ina=%b out=%b",ina,out);
endmodule

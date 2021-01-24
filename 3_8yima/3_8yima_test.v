`timescale  1us/1us 
module decoder3_8_test;
  wire[7:0] out ;
  reg ina,inb,inc;
  decoder3_8 u1(ina,inb,inc,out);
  initial
    begin
      ina=0;inb=0;inc=0;
      #50 ina=0;inb=0;inc=0;
      #50 ina=0;inb=0;inc=1;
      #50 ina=0;inb=1;inc=0;
      #50 ina=0;inb=1;inc=1;
      #50 ina=1;inb=0;inc=0;
      #50 ina=1;inb=0;inc=1;
      #50 ina=1;inb=1;inc=0;
      #50 ina=1;inb=1;inc=1;
      #6000 $stop;
    end
  initial $monitor($time, , ,"ina=%b inb=%b inc=%b out=%b",ina,inb,inc,out);
endmodule
`timescale  1us/1us  
module led_test;
  reg key1,key2,key3,key4;
  wire led1,led2,led3,led4;
  led u1(key1,key2,key3,key4,led1,led2,led3,led4);
  initial
    begin
      key1=1;key2=1;key3=1;key4=1;
      #50 key1=1;key2=1;key3=1;key4=0;
      #50 key1=1;key2=1;key3=0;key4=1;
      #50 key1=1;key2=0;key3=1;key4=1;
      #50 key1=0;key2=1;key3=1;key4=1;
      #3000 $stop;
    end
  initial $monitor($time, , ,"key1=%b key2=%b key3=%b key4=%b out1=%b out2=%b out3=%b out4=%b",key1,key2,key3,key4,led1,led2,led3,led4);
  
  
endmodule

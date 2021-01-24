module led(key1,key2,key3,key4,led1,led2,led3,led4);
input key1,key2,key3,key4;
output reg led1,led2,led3,led4;

always@(key1 or key2 or key3 or key4)
begin
	led1=!key1;
	led2=!key2;
	led3=!key3;
	led4=!key4;
end
endmodule
module encoder8_3(ina,out);
input[7:0] ina;
output[2:0] out;

function[2:0] encoder;
input[7:0] ina;
casex(ina)
	8'b1xxxxxxx:encoder=3'b111;
	8'bx1xxxxxx:encoder=3'b110;
	8'bxx1xxxxx:encoder=3'b101;
	8'bxxx1xxxx:encoder=3'b100;
	8'bxxxx1xxx:encoder=3'b011;
	8'bxxxxx1xx:encoder=3'b010;
	8'bxxxxxx1x:encoder=3'b001;
	8'bxxxxxxx1:encoder=3'b000;
	default:encoder=3'bxxx;
endcase
endfunction

assign out=encoder(ina);	
endmodule
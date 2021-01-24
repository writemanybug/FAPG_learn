module stop(clk,rst,out,out1);
input clk;
input	rst;
output out;
output out1;
reg[7:0] out;
reg[7:0] out1;
always @(posedge clk)
begin
	if(!rst)
	begin
		out<=8'b00000000;
		out1<=8'b00000000;
	end
	else
		begin
		out=out+1;
			if(out==8'b00111100)
			  begin
				out1=out1+1;
				out<=8'b00000000;
				end
		end
end
endmodule

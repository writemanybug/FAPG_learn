module data_reg(clk,rst,data_in,data_out);

input clk,rst;
input[3:0] data_in;
output[3:0] data_out;
reg[3:0] data_out;

always@(posedge clk)
begin
	if(!rst)
		data_out <= 8'h00;
	else
		data_out <= data_in;
end
endmodule



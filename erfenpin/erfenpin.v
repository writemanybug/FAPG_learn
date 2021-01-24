module erfenpin(clk,out);
	input clk;
	output reg out=0;
	integer flag=0;
	always@(posedge clk)
	begin
		flag=flag+1;
		if(flag==5)
		begin
			flag=0;
			out=!out;
		end
		
	end
endmodule
module counter(clk,rst,out);
	input clk;
	input rst;
	output[4:0] out;    //[]位宽
	reg[4:0] out  = 5'b00000;    //always 里面赋值都 都是reg型  寄存器型
	always@(posedge clk or posedge rst)
	begin 
		if(!rst)
		  out<=0;
		else 
			begin 
				if (out < 25)
					out <= out+1;
				else out<=0;	
	      end 		
	end 
endmodule

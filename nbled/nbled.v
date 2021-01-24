module nbled(clk,rst,led);//50MHz
	input clk,rst;
	output reg[11:0] led;
	reg clk_1;
	integer n=0;
	reg[2:0] state;
	parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
	
	function reg[11:0] in;
		input reg[11:0] led;
		reg[5:0] led1,led2;
		led1=led[11:6];
		led2=led[5:0];
		if(led==12'h000||led==12'hfff)
		begin
			in=12'h801;
		end
		else
		begin
			led2=led2*2+1'b1;
			led1=(led1>>>1)+6'h20;
			in={led1,led2};
		end			
	endfunction
	
	function reg[11:0] out;
		input reg[11:0] led;
		reg[5:0] led1,led2;
		led1=led[11:6];
		led2=led[5:0];
		if(led==12'h000||led==12'hfff)
		begin
			out=12'h060;
		end
		else
		begin
			led2=(led2>>>1)+6'h20;
			led1=led1*2+1'b1;
			out={led1,led2};
		end			
	endfunction
	
	function reg[11:0] left;
		input reg[11:0] led;
		if(led==12'h000||led==12'hfff)
		begin
			left=12'h001;
		end
		else
		begin
			left=led*2+1;
		end			
	endfunction
	
	
	function reg[11:0] right;
		input reg[11:0] led;
		if(led==12'h000||led==12'hfff)
		begin
			right=12'h800;
		end
		else
		begin
			right=(led>>>1)+12'h800;
		end			
	endfunction
	
	
	always@(posedge clk) 
	begin
		n<=n+1;
		if(n==12_499_999) 
		begin
			clk_1<=~clk_1;
			n<=0;
		end
	end
	
	always@(posedge clk_1 )
	begin
		if(!rst)
		begin
			state <= S0;
			led=12'h000;
		end
		else
		begin
		case(state)
		S0:begin if(led == 12'h000) begin state <= S1; led <= left(led); end
					else begin state <= S0; led <= 0; end
			end
		S1:begin if(led == 12'hfff) begin state <= S2; led <= right(led); end
					else begin state <= S1; led <= left(led); end
			end
		S2:begin if(led == 12'hfff) begin state <= S3; led <= in(led); end
					else begin state <= S2; led <= right(led); end
			end
		S3:begin if(led == 12'hfff) begin state <= S4; led <= out(led); end
					else begin state <= S3; led <= in(led); end
			end
		S4:begin if(led == 12'hfff) begin state <= S0; led <= 0; end
					else begin state <= S4; led <= out(led); end
			end
		default:begin state <= S0; led <= 0;end
		endcase
		end
	end

endmodule
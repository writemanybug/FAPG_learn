module led(clk,rst,x,led);
input clk,rst,x;
output[11:0] led;
reg clk_1;
reg[31:0] count;
reg[11:0] led;
reg[2:0] state;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;

always@(posedge clk) //clk是50Mhz（G1）
begin
	count<=count+1;
	if(count==12_499_999) 
	begin
		clk_1<=~clk_1;
		count<=0;
	end
end

always@(posedge clk_1 or negedge rst)
begin
	if(!rst)
	begin
		state <= S0;
		led <= 12'h000;
	end
	else case(state)
		S0:begin if(led == 12'h000) begin state <= S1; led <= led1(led); end
					else begin state <= S0; led <= 0; end
			end
		S1:begin if(led == 12'h000) begin state <= S2; led <= led2(led); end
					else begin state <= S1; led <= led1(led); end
			end
		S2:begin if(led == 12'h000) begin state <= S3; led <= led3(led); end
					else begin state <= S2; led <= led2(led); end
			end
		S3:begin if(led == 12'h000) begin state <= S4; led <= led4(led); end
					else begin state <= S3; led <= led3(led); end
			end
		S4:begin if(led == 12'h000) begin state <= S0; led <= 0; end
					else begin state <= S4; led <= led4(led); end
			end
		default:begin state <= S0; led <= 0;end
		endcase
end


function[11:0] led1;
input[11:0] led;
begin
	if(led == 0)
		led1 = 12'h001;
	else
		begin
			led1 = 1 + (led<<1);
			if(led == 12'hfff)
				led1 = 0;
		end
end
endfunction

function[11:0] led2;
input[11:0] led;
begin
	if(led == 0)
		led2 = 12'h800;
	else
		begin
			led2 = 12'h800 + (led>>1);
			if(led == 12'hfff)
				led2 = 0;
		end
end
endfunction

function[11:0] led3;
input[11:0] led;
begin
	if(led == 0)
		led3 = 12'h801;
	else
		begin
			led3 = (12'h800 + (led>>1)) | (1 + (led<<1));
			if(led == 12'hfff)
				led3 = 0;
		end
end
endfunction

function[11:0] led4;
input[11:0] led;
reg[5:0] a,b;
begin
	if(led == 0)
		led4 = 12'h060;
	else
		begin
			a = led[11:6];
			b = led[5:0];
			led4 = {(6'h01 + (a<<1)),(6'h20 + (b>>1))};
			if(led == 12'hfff)
				led4 = 0;
		end
end
endfunction

endmodule

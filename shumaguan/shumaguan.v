module shumaguan(seg,sel,key);
input wire[7:0] key;
output reg[2:0] sel=3'bxxx;
output reg[7:0] seg=8'b00000000;
always@(key)
	begin
		case(key)
		8'b11111110:
		begin
		sel=3'd0;seg=8'h3f;
		end
		8'b11111101:
		begin
		sel=3'd1;seg=8'h06;
		end
		8'b11111011:
		begin
		sel=3'd2;seg=8'h5b;
		end
		8'b11110111:
		begin
		sel=3'd3;seg=8'h4f;
		end
		8'b11101111:
		begin
		sel=3'd4;seg=8'h66;end
		8'b11011111:begin
		sel=3'd5;seg=8'h6d;end
		8'b10111111:begin
		sel=3'd6;seg=8'h7d;end
		8'b01111111:begin
		sel=3'd7;seg=8'h07;end
		default:begin
		sel=3'bxxx;seg=8'hxx;end
		endcase
		
	end

endmodule
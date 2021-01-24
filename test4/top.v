module top(clk,reset,data_out); //顶层文件

input clk,reset;
output[3:0] data_out;
wire[3:0] out;		//中间变量

counter u1(.reset(reset), .out(out), .clk(clk));  //不用按顺序
data_reg u2(.rst(reset), .clk(clk), .data_in(out), .data_out(data_out));

endmodule

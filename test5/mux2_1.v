module mux2_1(in0,in1,sel,out);

input in0,in1,sel;
output out;

assign out=sel?in0:in1;

endmodule

module top(a,b,cin,sel,out);

input a,b,cin,sel;
output out;
wire in0,in1;

adder1 u1(.a(a), .b(b), .cin(cin), .sum(in0), .cout(in1));
mux2_1 u2(.in0(in0), .in1(in1), .sel(sel), .out(out));

endmodule

module stopwatch(clk,rst,sout,mout,hout);
	input clk;
	input rst;
	output sout;
	output mout;
	output hout;
	reg[7:0] sout=8'b00000000;
	reg[7:0] mout=8'b00000000;
	reg[7:0] hout=8'b00000000;
	always@(posedge clk)
	begin
		if(!rst) 
		begin
		sout<=8'b00000000;
		mout<=8'b00000000;
		hout<=8'b00000000;
		end
		else
			begin
				sout=sout+1;
				if(sout==8'd60) 
				begin
					sout<=8'b00000000;
					mout=mout+1;
					if(mout==8'd60)
					  begin
					    mout<=8'b00000000;
					    hout<=hout+1;
					    if(hout==8'd24) hout<=8'b00000000;
					  end
				end
			end
	end
	
endmodule
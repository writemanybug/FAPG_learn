module time_clock(clk,rst,seg,sel);
	input clk;
	input rst;
	output reg[7:0] seg;
	output reg[2:0] sel;
	integer sout=0;
	integer mout=0;
	integer hout=0;
	integer i=0;


	task case1;
	input num;
	output reg [7:0] seg;
	case(num)	
		0:seg=8'h3f;
		1:seg=8'h06;
		2:seg=8'h5b;
		3:seg=8'h4f;
		4:seg=8'h66;
		5:seg=8'h6d;
		6:seg=8'h7d;
		7:seg=8'h07;
		8:seg=8'h7f;
		9:seg=8'h6f;
		endcase
	endtask
	
	task show;										//娉ㄦ剰鏃犵鍙ｅ垪琛
		input sout,mout,hout;							//杈撳叆绔彛鍜屾暟鎹被鍨嬪０鏄
		output reg [2:0] sel;
		output reg [7:0] seg;
		integer h,l;
		h=hout/10;
		l=hout%10;
		sel=3'd0;
		case1(h,seg);
		sel=3'd1;
		case1(l,seg);
		sel=3'd2;
		seg=8'h40;

		
		
		h=mout/10;
		l=mout%10;
		sel=3'd3;
		case1(h,seg);
		sel=3'd4;
		case1(l,seg);
		sel=3'd5;
		seg=8'h40;
		
		h=mout/10;
		l=mout%10;
		sel=3'd6;
		case1(h,seg);
		sel=3'd7;
		case1(l,seg);
		
	endtask
	


	always@(posedge clk)
	begin
		if(rst) 
		begin
		sout<=0;
		mout<=0;
		hout<=0;
		
		show(sout,mout,hout,sel,seg);
		end
		else 
			begin
			i=i+1;
			if(i==999)
				i=0;
			if(i<999)
				show(sout,mout,hout,sel,seg);
			else
			begin
				sout=sout+1;
				if(sout==8'd60) 
				begin
					sout<=0;
					mout=mout+1;
					if(mout==8'd60)
					  begin
					    mout<=0;
					    hout<=hout+1;
					    if(hout==8'd24) hout<=0;
					  end
				end
			end
			end
	end
endmodule
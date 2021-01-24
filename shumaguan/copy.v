module xuehao(res,clk,seg,sel,add,sub,stop,mode,led);
	input clk;
	input res;
	input add,sub,stop,mode;
	output reg[2:0] sel;
	output reg[7:0] seg;
	output reg[11:0] led;
	integer i=0;
	integer j=0;
	integer s=0;
	integer m=0;
	integer h=0;
	integer data=0;
	integer flag=0;
	integer stop_flag=0;
	
	
	function reg[7:0] case1;
		input integer num;
		case(num)	
			0:case1=8'h3f;
			1:case1=8'h06;
			2:case1=8'h5b;
			3:case1=8'h4f;
			4:case1=8'h66;
			5:case1=8'h6d;
			6:case1=8'h7d;
			7:case1=8'h07;
			8:case1=8'h7f;
			9:case1=8'h6f;
			endcase
	endfunction
	
	
	always@(posedge clk)
	begin
	if(!res)
	begin i=0;s=0;m=0;h=0;flag=0;led=12'h001;end
	else if(!stop)
	begin
		stop_flag=!stop_flag;	
	end
	else if(!stop_flag)
	begin
		i=i+1;
		if(i==999)
		begin
			s=s+1;
			if(s==60)
			begin
				s=0;
				m=m+1;
				if(m==60)
				begin
					m=0;
					h=h+1;
					if(h==24)
					h=0;
				end
			end
			i=0;
		end
	end
	else
	begin
			if(!mode)
			begin
					flag=flag+1;
					led=led+1'b1;
					if(flag==3)
						flag=1;
			end
			if(!add)
			begin
				if(flag==0)
					s=s+1;
				if(flag==1)
					m=m+1;
				if(flag==2)
					h=h+1;
			end
			if(!sub)
			begin
				if(flag==0)
					s=s-1;
				if(flag==1)
					m=m-1;
				if(flag==2)
					h=h-1;
			end
	end
	end
	
	
	always@(posedge clk)
		begin
			j=j+1;
			case(j)
			1:begin sel=3'd7; data=s%10;seg=case1(data);end
			2:begin sel=3'd6; data=s/10;seg=case1(data);end
			
			3:begin sel=3'd5; seg=8'h40;end
			
			4:begin sel=3'd4; data=m%10;seg=case1(data);end
			5:begin sel=3'd3; data=m/10;seg=case1(data);end
			
			6:begin sel=3'd2; seg=8'h40;end
			
			7:begin sel=3'd1; data=h%10;seg=case1(data);end
			8:begin sel=3'd0; data=h/10;seg=case1(data);end
			endcase
			if(j==8)
				j=0;
		end
		
endmodule
		
		
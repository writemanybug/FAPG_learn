module jifenping(q,clk,reset,n);
    output reg q;
    input reset;
    input clk;
    input[7:0] n;
    
    reg q1,q2,q3=1'b0;                // 内部寄存器变量，分别是两个占空比为1/3的分频；
    reg[7:0]  count1,count2,count3=0;

always @ *
	begin
	  q=n[0]?q1|q2:q3;
	end
always @ (posedge clk or posedge reset) //上升沿生成的三分频q1；
    if (reset)
    begin
      q1<=1'b0;
      count1<=0;
	end
    else 
	begin
		count1<=count1+1;
		if(count1==((n-1)/2)) q1<=~q1;
		if(count1==n-1)
		begin
			q1<=~q1;
			count1<=0;
		end
	end
       
       
always @ (negedge clk or posedge reset)     //下��u�沿生成的三分频信号q2， 该代码原

 if (reset)
    begin
      q2<=1'b0;
      count2<=0;
	end
    else 
	begin
		count2<=count2+1;
		if(count2==((n-1)/2)) q2<=~q2;
		if(count2==n-1)
		begin
			q2<=~q2;
			count2<=0;
		end
	end
	
always@(posedge clk or posedge reset)
  if (reset)
    begin
      q3<=1'b0;
      count3<=0;
	end
	else
	begin
		count3<=count3+1;
		if(count3==n/2-1)
		begin
			count3<=0;
			q3<=~q3;
		end
		
	end	

endmodule
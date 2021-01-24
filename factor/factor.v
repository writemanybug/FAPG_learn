module factor;
  function automatic integer jiecheng;
  input integer n;
  if(n<=1)
    jiecheng=1;
  else
    jiecheng=jiecheng(n-1)*n;
  endfunction
  
  integer out;
  integer n;
  initial
  begin
    for(n=1;n<=9;n=n+1)
      begin
        out=jiecheng(n);
        $display("%d %d",n,out);
      end
  end  
endmodule

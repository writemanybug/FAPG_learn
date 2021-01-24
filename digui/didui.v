module didui(ina,out);
input ina;
output out;

function automatic integer jiecheng;
input ina;
if(ina>1) jiecheng=jiecheng(ina-1)*ina;
else jiecheng=1;
endfunction 

assign out=jiecheng(ina);
endmodule
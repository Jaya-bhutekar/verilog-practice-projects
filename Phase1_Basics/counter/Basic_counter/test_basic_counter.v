module counter_test;

reg clk,clr;
wire [7:0] out;

counter_simple test(out,clk,clr);
initial 
begin
clk=1'b0; clr=1'b1;
#5 clr=1'b0;
end

always #5 clk=~clk;

initial $monitor("time= %d , clk=%b  , clr=%1 , out=%O " ,$time,clk,clr,out);
endmodule

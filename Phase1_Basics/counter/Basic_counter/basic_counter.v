module counter_simple(out,clk,clr);

input clk,clr;
output reg [7:0]out;

always @(posedge clk,posedge clr)
begin
			if(clr) out<=9'h0;
			else
			  out<=out+1;
			
end
endmodule

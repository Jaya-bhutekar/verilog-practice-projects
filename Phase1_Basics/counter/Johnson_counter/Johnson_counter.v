`timescale 1ns / 1ps

module johnson_count(count,clk,clr);

input clk,clr;
output reg[3:0]count;

always @(posedge clk,posedge clr)
		if(clr) count<=4'b0;
		else begin
				/*count<=count<<1;
		      count[0]<=~count[3];*/
				
				count<={count[2:0],~count[3]};
			 end

endmodule

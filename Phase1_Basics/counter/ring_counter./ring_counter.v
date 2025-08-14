`timescale 1ns / 1ps
module Ring_counter(out,clk,clr);

input clk,clr;
output reg [3:0]out;

always @(posedge clk,posedge clr)
begin

		if(clr) out<=4'b1000;
		else
		begin
      // here out[3] directly sifting to the right most bit
      //out<={out[2:0],out[3]};  this can be the ulternative for those two lines 
				
				out<=out<<1;          // here we are shifting it right and interchanging values of msb and lsb simultaneously
				out[0]<=out[3];
		
		end

end



/*

This code can be used to create data flip-flops and give a separate bit as the init

		DFF D0(out[0],out[3],clk,clr,1'b1);
		DFF D1(out[1],out[0],clk,clr,1'b0);
		DFF D2(out[2],out[1],clk,clr,1'b0);
		DFF D3(out[3],out[2],clk,clr,1'b0);


endmodule


module DFF(out,in,clk,clr,init);
input clk,clr,in,init;
output reg out;

		always @(posedge clk , posedge clr)
		
				if(clr) out<=init;
				else begin
						out<=in;
		end

*/
endmodule

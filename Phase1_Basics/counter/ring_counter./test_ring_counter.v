`timescale 1ns / 1ps


module test_ring_counter;

	// Inputs
	reg clk;
	reg clr;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	Ring_counter uut (
		.out(out), 
		.clk(clk), 
		.clr(clr)
	);

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		clr = 1'b1;
		#5 clr = 1'b0;

		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		// Add stimulus here

	end
	
	always #5 clk=~clk;
	
	initial $monitor("time=%d  clk=%b clr=%b out%O ",$time,clk,clr,out);
      
endmodule


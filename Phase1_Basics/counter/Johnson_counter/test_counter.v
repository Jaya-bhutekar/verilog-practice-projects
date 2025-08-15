`timescale 1ns / 1ps


module test_counter;

	// Inputs
	reg clk;
	reg clr;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	johnson_count uut (
		.count(count), 
		.clk(clk), 
		.clr(clr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 1;
      #5 clr=0;
		// Wait 100 ns for global reset to finish
		#100 $stop;
        
		// Add stimulus here

	end
	always #5 clk=~clk;
	
	initial
	$monitor($time," clk=%b clr=%b count=%o ",clk,clr,count);
      
endmodule


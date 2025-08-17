`timescale 1ns / 1ps
module BOOTH(ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addsub,decr,ldcnt,data_in,clk,qm1,eqz);

input ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addsub,decr,ldcnt,clk;
input [15:0]data_in;

output qm1,eqz;

wire [15:0] A,M,Q,Z;
wire [4:0] count;

assign eqz=~|count;

shiftreg AR(A,Z,A[15],clk,ldA,clrA,sftA);
shiftreg QR(Q,data_in,A[0],clk,ldQ,clrQ,sftQ);
dff QMI(Q[0],qm1,clk,clrff);
PIPO MR(data_in,M,clk,ldM);
ALU al(Z,A,M,addsub);
count CN(count,decr,ldcnt,clk);

endmodule


module shiftreg(data_out,data_in,s_in,clk,load,clr,sft);

input [15:0]data_in;
input s_in,clk,load,clr,sft;
output reg[15:0]data_out;

always @(posedge clk)
begin
		if(clr) data_out<=0;
		else if(load)
				data_out<=data_in;
		else if(sft)
				data_out<={s_in,data_out[15:1]};
end
endmodule


module dff(data_out,data_in,clk,clr);

input data_in,clk,clr;
output reg data_out;

always @(posedge clk)
	if(clr) data_out<=1'b0;
	else data_out<=data_in;
	
endmodule



module PIPO(data_out,data_in,clk,load);

input clk,load;
input [15:0]data_in;
output reg[15:0]data_out;

always @(posedge clk)
	if(load) data_out<=data_in;
	
endmodule

module count(data_out,decr,ldcnt,clk);

input clk,ldcnt,decr;
output reg [4:0] data_out;

always @(posedge clk)
begin
if(ldcnt) data_out<=5'b10000;
else if(decr) data_out<=data_out-1;
end

endmodule


module ALU(out,in1,in2,addsub);

input addsub;
input [15:0]in1,in2;
output reg[15:0] out;

always @(*)
if (addsub==0) out=in1-in2;
else out=in1+in2;

endmodule


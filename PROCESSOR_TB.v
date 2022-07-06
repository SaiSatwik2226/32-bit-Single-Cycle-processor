`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:19 03/22/2022
// Design Name:   Processor_Lab7
// Module Name:   G:/My Drive/SS Prime/Academics/3rd Year/3-2/CS F342 COMPUTER ARCHITECTURE/Lab Verilog Files/processor/PROCESSOR_LAB7_TB.v
// Project Name:  processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_Lab7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_TB;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.Clk(Clk), 
		.Reset(Reset)
	);

	initial begin
		Reset = 1'b0;
		#20;
		Reset = 1'b1;
		#1;
		Reset = 1'b0;
	end
	
	initial begin
		Clk = 1'b1;
		
		repeat(14) begin
		#10;
		Clk = ~Clk;
		end
		
		$finish;
	end
      
endmodule


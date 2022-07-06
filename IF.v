`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:30 03/09/2021 
// Design Name: 
// Module Name:    IF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF(
    input clk,
	 input reset,
    output [31:0] Instr
    );

reg [31:0] PC;
IMem M1(PC,reset,Instr);

always@(posedge clk,posedge reset)
begin
	if(reset) PC <= 32'b0;
	else PC <= PC+4;
end

endmodule

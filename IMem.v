`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:18 03/09/2021 
// Design Name: 
// Module Name:    IMem 
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
module IMem(
    input [31:0] Addr,
    input reset,
    output reg [31:0] InstrCode
    );

reg [7:0] Mem [35:0];

always@(posedge reset)
begin
	if(reset)
	begin
		$readmemh("code.mem",Mem);
	end
end

always @(Addr) begin
	InstrCode = {Mem[Addr+3],Mem[Addr+2],Mem[Addr+1],Mem[Addr]};
	end

endmodule

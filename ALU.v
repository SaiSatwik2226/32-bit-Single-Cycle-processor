`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:51 03/22/2022 
// Design Name: 
// Module Name:    ALU_Lab7 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Control,
	 input imm_signal,
	 input [20:0] imm,
    output reg[31:0] ALU_Result,
    output reg Zero
    );
	wire [4:0] shift_amt;
	assign shift_amt = imm[10:6];
	
	always @(A,B,ALU_Control)
	begin
	case(ALU_Control)
		4'b0000:	ALU_Result = A & B;
		4'b0001:	ALU_Result = A | B;
		4'b0010:	ALU_Result = A + B;
		4'b0110:	ALU_Result = A - B;
		4'b1110: ALU_Result = A<<shift_amt;/*SLL*/
		4'b1100: ALU_Result = A>>shift_amt;/*SRL*/
	endcase
	end
	always @(ALU_Result)
	begin
		if(ALU_Result==0) Zero = 1;
		else Zero = 0;
	end
endmodule

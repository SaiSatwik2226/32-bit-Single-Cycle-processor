`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:35 03/22/2022 
// Design Name: 
// Module Name:    Processor_Lab7 
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
module Processor(
    input Clk,
    input Reset
    );
	 wire [31:0] Instr_Code;
	 wire [31:0] result;
	 wire [31:0] Read_Data1;
    wire [31:0] Read_Data2;
    wire Reg_Write,Zero;
    wire [3:0] ALU_op;
	 wire [31:0] result1;
	 wire imm_signal;
	 
	 wire [20:0] imm;
	 assign imm = Instr_Code[21:0];
	 
	 IF i1(Clk,Reset,Instr_Code);
	 
	 Register_File rf1(Instr_Code[20:16],Instr_Code[15:11], Instr_Code[25:21], result1, Read_Data1, Read_Data2, Reg_Write, Clk, Reset);
	 	 
	 Control_Unit cu1(Instr_Code,ALU_op,imm_signal,Reg_Write);
	 reg [31:0] A,B;
	 always @(*)
		begin
			if(imm_signal==1)
				begin
					A = 32'b0; 
					B = {{11{imm[20]}}, imm};
				end
			else
				begin
					A = Read_Data1; 
					B = Read_Data2;
				end
		end
	 
	 ALU alu1(A,B, ALU_op, imm_signal, imm, result, Zero);
	 assign result1 = result;
endmodule

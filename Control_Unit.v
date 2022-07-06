`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:40 03/22/2022 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
    input [31:0] Instruction_Code,
	 output reg [3:0] ALU_op,
	 output reg imm_signal,
	 output reg Reg_Write
    );
	 wire [5:0] funct6;
	 assign funct6 = Instruction_Code[5:0];
	 always @(*) begin
		 //Reg_Write = 0;
		 Reg_Write = 1'b1;
		 imm_signal = 1'b0;
		 if(Instruction_Code[31:26] == 6'b000000)
			begin
				 case(funct6)
					 6'b100000: ALU_op = 4'b0010;/*add*/
					 6'b100010: ALU_op = 4'b0110;/*sub*/
					 6'b100100: ALU_op = 4'b0000;/*AND*/
					 6'b100101: ALU_op = 4'b0001;/*OR*/ 
					 6'b000000: ALU_op = 4'b1110;/*SLL*/
					 6'b000010: ALU_op = 4'b1100;/*SRL*/
				 endcase

		 end
		 if(Instruction_Code[31:26] == 6'b111111)
			begin 
				ALU_op = 4'b0010;
				imm_signal = 1'b1;
			end
	 end
endmodule

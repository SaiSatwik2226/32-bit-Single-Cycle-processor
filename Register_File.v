`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:09 03/08/2022 
// Design Name: 
// Module Name:    Register_File 
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

module Register_File(
    input [4:0] Read_Reg_Num1,
    input [4:0] Read_Reg_Num2,
    input [4:0] Write_Reg_Num,
    input [31:0] Write_Data,
    output reg [31:0] Read_Data1,
    output reg [31:0] Read_Data2,
    input Reg_Write,
    input Clk,
    input Reset
    );
	reg [31:0] Reg_files [31:0];
	integer i;
	
	
	always @(posedge Clk, posedge Reset)
		begin
			Read_Data1 = Reg_files[Read_Reg_Num1];
			Read_Data2 = Reg_files[Read_Reg_Num2];
			if(Reset)
				begin
					for(i=0;i<=31;i=i+1)
					Reg_files[i]=i+1;
				end
			else if(Reg_Write)
				begin
					Reg_files[Write_Reg_Num] <= Write_Data;
				end
		end
		
endmodule

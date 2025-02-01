`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 10:34:00 PM
// Design Name: 
// Module Name: last_round
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module last_round(clk,data_in,key_in,data_out_last);
input clk;
input [127:0]data_in;
input [127:0]key_in;
output [127:0] data_out_last;

wire [127:0] sub_data_out,shift_data_out;

subbytes s1(clk,data_in,sub_data_out);
shiftrows s2(clk,sub_data_out,shift_data_out);
assign data_out_last=shift_data_out^key_in;

endmodule
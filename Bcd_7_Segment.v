`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 04:30:07 PM
// Design Name: 
// Module Name: Bcd_7_Segment
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
module Bcd_7_Segment(input [3:0]a ,  output reg[6:0]y);

always@(*)begin 
    case(a)	   //gfedcba;
        4'h0 : y = 7'b1000000;
        4'h1 : y = 7'b1111001;
        4'h2 : y = 7'b0100100;
        4'h3 : y = 7'b0110000;
        4'h4 : y = 7'b0011001;
        4'h5 : y = 7'b0010010;
        4'h6 : y = 7'b0000010;
        4'h7 : y = 7'b1111000;
        4'h8 : y = 7'b0000000;
        4'h9 : y = 7'b0011000;
        4'ha : y = 7'b0100000;
        4'hb : y = 7'b0000011;
        4'hc : y = 7'b0100111;
        4'hd : y = 7'b0100001;
        4'he : y = 7'b0000100;
        4'hf : y = 7'b0001110;

        default : y=7'b0000000;

    endcase
end

endmodule

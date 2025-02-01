`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 05:56:38 PM
// Design Name: 
// Module Name: segment_control
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


module Segment_Control( 
    input clk_5sec,clk_1khz,
    input [127:0]data_out,
    output [6:0]seg,
    output reg [7:0]an
    
 );
 
 reg [31:0]display_txt ;
 reg [1:0]disp = 2'b0;
 reg [2:0]display;
 reg [3:0]val;
 reg [16:0]counter;
 
 
 always@(posedge clk_5sec) begin 
    
    case(disp) 
        2'b00 : display_txt <= data_out[127:96];
        2'b01 : display_txt <= data_out[95:64];
        2'b10 : display_txt <= data_out[63:32];
        2'b11 : display_txt <= data_out[31:0];
        
        default : display_txt <= data_out[31:0];
      endcase 
      disp <= (disp == 2'b11)? 2'b00 : (disp + 1);
     
 end
 
 always@(posedge clk_1khz)begin 
    case(display) 
        3'b000 : begin
                   an  <= 8'hfe;
                   val <= display_txt[3:0]; 
                 end 
        3'b001 : begin 
                    an  <= 8'hfd;
                    val <= display_txt[7:4];
                 end
        3'b010 : begin 
                    an  <= 8'hfb;
                    val <= display_txt[11:8];
                 end 
        3'b011 : begin 
                    an  <= 8'hf7;
                    val <= display_txt[15:12];
                 end 
        3'b100 : begin 
                    an  <= 8'hef;
                    val <= display_txt[19:16];
                 end
        3'b101 : begin
                    an  <= 8'hdf;
                    val <= display_txt[23:20];
                 end
        3'b110 : begin 
                    an  <= 8'hbf;
                    val <= display_txt[27:24];
                 end
        3'b111 : begin 
                    an  <= 8'h7f;
                    val <= display_txt[31:28];
                 end 
         default : display <= 3'b000;
      endcase
      
      display <= (display == 3'b111) ? (3'b000): (display+1);                                                
 end
 
 Bcd_7_Segment uui(.a(val),.y(seg));
 
endmodule

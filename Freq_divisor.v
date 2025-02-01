`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2024 07:07:50 PM
// Design Name: 
// Module Name: Freq_divisor
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


module Freq_divisor(
input clk,
output reg clk_5sec,clk_1khz
    );
    
    parameter divisor = 250000000;
 
    reg [31:0] counter1,counter2 ;
    
    always @(posedge clk) begin
         if(counter1 == divisor - 1)begin 
            counter1 <= 0;
            clk_5sec = ~clk_5sec;
         end 
         else 
              counter1 <= counter1 + 1;
     end   
     
     
                 
     always @(posedge clk) begin
         if(counter2 == 99999 )begin 
            counter2 <= 0;
            clk_1khz = ~clk_1khz;
         end 
         else 
              counter2 <= counter2 + 1;
     end               
            
        
endmodule

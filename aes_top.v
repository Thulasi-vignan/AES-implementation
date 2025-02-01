`timescale 1ns / 1ps

module aes_top(
//  input [127:0]key, data_in,
    input clk,
    output [7:0]an,
    output [6:0]seg
    );
    
    wire clk_5sec;
    wire clk_1khz;
    wire [127:0]data_out;
    reg [127:0]data_in;
    reg [127:0]key;
    
    initial begin 
        data_in =128'h54776F204F6E65204E696E652054776F;
        key = 128'h5468617473206D79204B756E67204675;
    end
   
    Freq_divisor uut(.clk(clk),.clk_5sec(clk_5sec),.clk_1khz(clk_1khz));
   
    aes_main uuf(.clk(clk),.data_in(data_in),.key(key),.data_out(data_out));
     
    Segment_Control uuh(.clk_5sec(clk_5sec),.clk_1khz(clk_1khz),.data_out(data_out),.seg(seg),.an(an));
    
    
endmodule

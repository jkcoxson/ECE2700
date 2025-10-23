`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 05:09:29 PM
// Design Name: 
// Module Name: DFF_dataflow
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


module DFF_dataflow(
    input d,
    output q,
    input clk
    );
    wire q1;
    wire clkb = ~clk;
    
    latch_dataflow d1(.d(d), .q(q1), .clk(clk));
    latch_dataflow d2(.d(q1), .q(q), .clk(clkb));
    
endmodule

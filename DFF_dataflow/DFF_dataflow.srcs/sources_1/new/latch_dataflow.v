`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 05:07:07 PM
// Design Name: 
// Module Name: latch_dataflow
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


module latch_dataflow(
    input d,
    output q,
    input clk
    );
    
    wire S;
    wire R;
    wire qb;
    
    assign #1 S=~d&clk;
    assign #1 R=d&clk;
    assign #2 qb=~(R|q);
    assign #2 q=~(S|qb);
endmodule

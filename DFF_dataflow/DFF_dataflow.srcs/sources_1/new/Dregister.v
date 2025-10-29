`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 01:41:12 PM
// Design Name: 
// Module Name: Dregister
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


module Dregister(
    input next, init, shift, rst, clk,
    output q
    );
    
    wire d;
    assign d = (rst & init) | (~rst & shift & next) | (~rst & ~shift & q);
    
    DFF n(.d(d), .q(q), .clk(clk));
endmodule

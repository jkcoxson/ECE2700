`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 05:11:08 PM
// Design Name: 
// Module Name: NewSevenSegment
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


module NewSevenSegment(
    input [3:0] wxyz,
    output [6:0] seg
    );
    
    wire [15:0] d;
    decoder4_16 D(.d(wxyz), .en(1'b1), .o(d));
    
    assign seg[0] = ~|(d & 16'hB7EB);
    assign seg[1] = ~|(d & 16'hF9E4);
    assign seg[2] = ~|(d & 16'hDFF4);
    assign seg[3] = ~|(d & 16'hB6DE);
    assign seg[4] = ~|(d & 16'hA2BF);
    assign seg[5] = ~|(d & 16'h8EFB);
    assign seg[6] = ~|(d & 16'h3EF7);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 12:44:51 PM
// Design Name: 
// Module Name: Dlatch_test
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


module Dlatch_test;
    reg j;
    reg k;
    reg clk;
    
    wire q;
    
    integer idx;
    
    wire [11:0] jvals = 8'b0110_1010;
    wire [11:0] kvals = 8'b0111_0001;
    
    JKFF dut(
        .clk(clk),
        .j(j),
        .k(k),
        .q(q)
     );
     
     initial begin
        j = 0;
        k = 1;
        idx = 0;
        clk = 1;
     end
     
     always #10 clk=~clk;
     
     always @(posedge clk) begin
        idx = (idx + 1) % 8;
        j = jvals[idx];
        k = kvals[idx];
     end
endmodule
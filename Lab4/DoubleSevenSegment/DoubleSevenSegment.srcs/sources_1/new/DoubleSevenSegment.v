`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 05:53:56 PM
// Design Name: 
// Module Name: DoubleSevenSegment
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


module DoubleSevenSegment #(parameter PRESCALER = 50_000)(
    input clk,
    input [7:0] sw,
    output [3:0] an,
    output [6:0] seg
    );
    
    wire sel;
    wire [3:0] selected_sw;
    
    ClockDivider #(.PRESCALER(PRESCALER)) CKD(
        .clkin(clk),
        .clkout(sel)
    );

    assign an[0] = clk;
    assign an[1] = ~clk;
    
    MUXArray m(.sel(sel), .a(sw[3:0]), .b(sw[7:4]), .o(selected_sw));
    NewSevenSegment s0(.wxyz(selected_sw), .seg(seg));
endmodule

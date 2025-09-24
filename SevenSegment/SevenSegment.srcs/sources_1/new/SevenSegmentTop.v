`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 04:35:37 PM
// Design Name: 
// Module Name: SevenSegmentTop
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


module SevenSegmentTop(
    input [7:0] sw,
    output [3:0] an,
    output [6:0] seg
    );

    wire [6:0] D;


//    wire NAN = sw[3] & (sw[1] | sw[2]);
//    assign seg = ~(D&~{7{NAN}});

    assign seg = ~D;
    assign an = ~sw[7:4];

     SevenSegmentTruthTable S1(
 //   SevenSegmentCombinational S1(
      .x3(sw[3]),
      .x2(sw[2]),
      .x1(sw[1]),
      .x0(sw[0]),
      .a(D[0]),
      .b(D[1]),
      .c(D[2]),
      .d(D[3]),
      .e(D[4]),
      .f(D[5]),
      .g(D[6])
    );
endmodule

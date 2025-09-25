`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab3
// Module Name: RippleCarry
// Project Name: RippleCarry
// Target Devices: Basys3
// Tool Versions: Vivado 2024.2.1
// Description:
//  full adder
// Dependencies:
//  none
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  reeeeeeeeeeeeeeee
//////////////////////////////////////////////////////////////////////////////////


module RippleCarry4 (
  carryin, X, Y, S, carryout
);
  input carryin;
  input [3:0] X, Y;
  output [3:0] S;
  output carryout;
  wire [3:1] C;

  FullAdder stage0 (carryin, X[0], Y[0], S[0], C[1]);
  FullAdder stage1 (C[1], X[1], Y[1], S[1], C[2]);
  FullAdder stage2 (C[2], X[2], Y[2], S[2], C[3]);
  FullAdder stage3 (C[3], X[3], Y[3], S[3], carryout);
endmodule

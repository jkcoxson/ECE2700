`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab3
// Module Name: FullAdder
// Project Name: FullAdder
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


module FullAdder (
  Cin, x, y, s, Cout
);
  input Cin, x, y;
  output s, Cout;
  wire z1, z2, z3;

  xor (s, x, y);

  // if anything we do will wrap back around, set the carry out to 1
  and (z1, x, y);
  and (z2, x, Cin);
  and (z3, y, Cin);
  or (Cout, z1, z2, z3);
endmodule

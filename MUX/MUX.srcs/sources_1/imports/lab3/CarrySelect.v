`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab3
// Module Name: CarrySelect
// Project Name: CarrySelect
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


module CarrySelect (
  carryin, X, Y, S, carryout
);
  input carryin;
  input [3:0] X, Y;
  output [3:0] S;
  output carryout;

  wire [3:0] S0, S1;
  wire c0, c1;

  RippleCarry4 RCA0 (0, X, Y, S0, c0);
  RippleCarry4 RCA1 (1, X, Y, S1, c1);

  assign S       = (carryin) ? S1 : S0;
  assign carryout = (carryin) ? c1 : c0;
endmodule

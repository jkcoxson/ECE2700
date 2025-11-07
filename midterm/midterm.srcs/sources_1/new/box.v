`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 09:37:38 AM
// Design Name: 
// Module Name: box
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

module Crypto_1 (
    input  [1:0] x,
    input  [1:0] y,
    output [3:0] m
);
  // wire a, b, c, d;
  // assign m = {d, c, b, a};
  // assign d = ((x[0] & y[1]) & (x[1] & y[0])) & (x[1] & y[1]);
  // assign c = (x[1] & y[1]) ^ ((x[0] & y[1]) & (x[1] & y[0]));
  // assign b = (x[1] & y[0]) ^ (x[0] & y[1]);
  // assign a = x[0] & y[0];
  assign m = x * y;
endmodule

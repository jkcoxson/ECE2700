`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab1
// Module Name: myandgate
// Project Name: myandgate
// Target Devices: Basys3
// Tool Versions: Vivado 2024.2.1
// Description:
//  a trivial module to implement an and gate
// Dependencies:
//  none
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  reeeeeeeeeeeeeeee
//////////////////////////////////////////////////////////////////////////////////


module myandgate (
    //    output F,
    output reg F,
    input A,
    input B
);

  // and U1 (F, A, B);  // original implementation

  //    assign F = A & B; // alternate 1

  always @(A, B) begin
    F = A & B;
  end

endmodule

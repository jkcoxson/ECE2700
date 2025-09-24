`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab1
// Module Name: tb_CarrySelect
// Project Name: tb_CarrySelect
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

`timescale 1ns/1ps

module tb_CarrySelect;
  reg [3:0] X, Y;
  reg carryin;
  wire [3:0] S;
  wire carryout;

  // Instantiate the DUT (Device Under Test)
  CarrySelect dut (
    .carryin(carryin),
    .X(X),
    .Y(Y),
    .S(S),
    .carryout(carryout)
  );


  initial begin
    // Loop through some values
    for (integer i = 0; i < 16; i = i + 1) begin
      for (integer j = 0; j < 16; j = j + 1) begin
        for (integer cin = 0; cin < 2; cin = cin + 1) begin
          X = i;
          Y = j;
          carryin = cin;
          #1; // wait 1 timestep for signals to propagate
          CarrySelect()
        end
      end
    end
  end

endmodule


`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: ECE2700 Dr. Zhen Zhang
//
// Create Date: 09/03/2025 03:45:12 PM
// Design Name: Lab1
// Module Name: testbench
// Project Name: testbench
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



module testbench ();
  reg in1, in2, clk;
  wire out;

  myandgate DUT (
      .A(in1),
      .B(in2),
      .F(out)
  );

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);

    clk = 0;
    in1 = 0;
    in2 = 0;
    forever #10 clk = ~clk;
  end

  always @(posedge clk) begin
    in1 = ~in1;
    in2 = in2 + in1;
  end

endmodule

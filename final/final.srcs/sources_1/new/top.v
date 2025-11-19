`timescale 1ns / 1ps

module top (
    input btn0,
    input clk,
    input [15:0] sw,
    output [15:0] led,  // binary LEDs
    output [6:0] seg,  // 7 segment display
    output [3:0] an  // 7 segment annodes
);

  wire [2:0] operation;

  state s (
      .btn(btn0),
      .clk(clk),
      .operation(operation)
  );

  wire error;
  math m (
      .x(sw[7:0]),
      .y(sw[15:8]),
      .state(operation),
      .s(led),
      .error(error)
  );

  four_seven_segment display (
      .clk(clk),
      .value(led),
      .error(error),
      .state(operation),
      .an(an),
      .seg(seg)
  );

endmodule

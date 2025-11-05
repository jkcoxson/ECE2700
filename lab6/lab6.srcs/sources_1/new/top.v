`timescale 1ns / 1ps

module top (
    input btn0,
    btn1,
    clk,
    output [7:0] o
);

  wire deb0;
  wire deb1;

  debouncer d0 (
      .b  (btn0),
      .clk(clk),
      .d  (deb0)
  );
  debouncer d1 (
      .b  (btn1),
      .clk(clk),
      .d  (deb1)
  );
  counter c (
      .clk(clk),
      .incr(deb0),
      .rst(deb1),
      .q(o)
  );
endmodule

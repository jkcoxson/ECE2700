`timescale 1ns / 1ps

module counter (
    input clk,
    input incr,
    input rst,
    output reg [7:0] q
);
  always @(posedge clk) begin
    if (rst) q <= 0;
    else if (incr) q <= q + 1;
  end
endmodule


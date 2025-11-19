`timescale 1ns / 1ps

module state (
    input btn,
    input clk,
    output reg [2:0] operation
);

  wire new_btn;
  debouncer b (
      .b(btn),
      .clk(clk),
      .d  (new_btn)
  );

  always @(posedge clk) begin
    if (new_btn) begin
      operation <= operation + 1;
    end
  end
endmodule

`timescale 1ns / 1ps

module four_seven_segment_tb;

  // Testbench signals
  reg         clk;
  reg  [15:0] value;
  reg  [ 2:0] state;
  reg         error;
  wire [ 3:0] an;
  wire [ 6:0] seg;

  // Instantiate DUT
  four_seven_segment #(
      .PRESCALER(20)
  ) dut (
      .clk(clk),
      .value(value),
      .state(state),
      .error(error),
      .an(an),
      .seg(seg)
  );

  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  initial begin
    // Initial values
    value = 16'h0000;
    state = 3'b000;
    error = 0;

    #20;

    // --- Test 1: simple number display ---
    value = 16'h1234;
    state = 3'b001;
    error = 0;
    #30;

    // --- Test 2: change value ---
    value = 16'hBEEF;
    #30;

    // --- Test 3: assert error + state change ---
    state = 3'b101;
    error = 1;
    #30;

    // --- Test 4: another state ---
    state = 3'b111;
    error = 0;
    #30;

    // Let page toggle a few times
    #200;

    $finish;
  end

endmodule

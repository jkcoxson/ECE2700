`timescale 1ns / 1ps
module debouncer_test ();
  reg  clk;
  reg  b;
  wire d;

  debouncer dut (
      .b  (b),
      .clk(clk),
      .d  (d)
  );

  always #5 clk = ~clk;

  initial begin
    // Initialize
    clk = 0;
    b   = 0;
    #20;

    // Simulate a bouncy button press:
    b = 1;
    #10;
    b = 0;
    #10;
    b = 1;
    #10;
    b = 0;
    #10;
    b = 1;
    #100;  // finally stable press

    // Hold the button for a while
    #200;

    // Simulate a bouncy release:
    b = 0;
    #10;
    b = 1;
    #10;
    b = 0;
    #10;
    b = 1;
    #10;
    b = 0;
    #100;

    $finish;
  end
endmodule

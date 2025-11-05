`timescale 1ns / 1ps


module counter_test ();

  reg clk;
  reg incr;
  reg rst;
  wire [7:0] q;

  integer i;

  counter dut (
      .clk(clk),
      .incr(incr),
      .rst(rst),
      .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    // Initialize
    clk = 0;
    incr = 0;
    i = 0;
    rst = 1;  // assert reset initially
    #10;
    rst = 0;  // deassert reset after one cycle

    #20;

    for (i = 0; i < 30; i = i + 1) begin
      incr = ~incr;
      #8;
    end

    rst = 1;
    #20;

    $finish;
  end
endmodule

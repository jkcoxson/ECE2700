// Jackson Coxson
`timescale 1ns / 1ns

module subtract3_tb;
  reg  [2:0] a, b;
  wire [2:0] s;
  wire overflow;

  // Instantiate the subtractor
  subtract3 uut (
    .x(a),
    .y(b),
    .s(s),
    .overflow(overflow)
  );

  // Convert 3-bit two's complement to integer (for readable output)
  function integer twos3;
    input [2:0] val;
    begin
      if (val[2] == 1'b1)
        twos3 = val - 8;   // sign-extend negative numbers
      else
        twos3 = val;
    end
  endfunction

  integer i, j;
  integer expected;

  initial begin
    $display("               A    B   |  A-B   |  Output | Overflow  |  Pass?");
    $display("---------------------------------------------------------------");

    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        a = i[2:0];
        b = j[2:0];
        #1; // wait for propagation

        // compute expected result (3-bit wrap-around)
        expected = (twos3(a) - twos3(b)) & 7; // modulo 8 wraparound

        $display("%4d (%03b)  %4d (%03b)  |  %4d  |   %03b   |    %b      |  %s",
                 twos3(a), a, twos3(b), b,
                 twos3(a) - twos3(b), s, overflow,
                 (s === expected[2:0]) ? "OK" : "FAIL");
      end
    end

    $finish;
  end
endmodule

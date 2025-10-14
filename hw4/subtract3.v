// Jackson Coxson
`timescale 1ns / 1ns

module subtract3 (
  input [2:0] x, y,
  output [2:0] s,
  output overflow
);
  wire t1;
  wire [3:0] st;

  ripple4bitAdd adder(
    1'b1,                             // Ci = 1
    {x[2], x[2], x[1], x[0]},         // Sign-extended A
    {~y[2], ~y[2], ~y[1], ~y[0]},     // NOT B
    st,                               // 4-bit sum output
    t1                                // carry-out (unused, don't care didn't ask)
  );

  assign s = st[2:0];
  xor(overflow, st[3], st[2]);
endmodule

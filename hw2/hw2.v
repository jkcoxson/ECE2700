// Jackson Coxson

module FullAdderHomework (
  input Cin, x, y,
  output sum, Cout
);
  wire t1;

  // Structural for sum
  xor (t1, x, y);
  xor (sum, t1, Cin);

  // Behavioral for carry-out
  assign Cout = (x & y) | (x & Cin) | (y & Cin);
endmodule

module HalfAdder (
  input x, y,
  output sum, Cout
);
  assign sum = (x | y) & !(x & y);
  assign Cout = x & y;
endmodule

module FullAdderHomework2 (
  input Cin, x, y,
  output sum, Cout
);
  wire t1, t2;
  wire partial_sum;

  HalfAdder A1(x, y, partial_sum, t1);
  HalfAdder A2(partial_sum, Cin, sum, t2);

  assign Cout = t1 | t2;
endmodule


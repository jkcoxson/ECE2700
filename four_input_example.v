`timescale 1ns / 1ns

// refer to the png image for the diagram

module four_input_example (
    x1,
    x2,
    x3,
    x4,
    f,
    g,
    h
);
  input x1, x2, x3, x4;
  output f, g, h;

  and (a1_3, x1, x3);
  and (a2_4, x2, x4);

  // not(nx3, x3); == ~x3
  or (o1_n3, x1, ~x3);
  or (on2_4, ~x2, x4);

  or (g, a1_3, a2_4);
  and (h, o1_n3, on2_4);

  or (f, g, h);

endmodule

// this is equivalent to the above
module four_input_example_behavioral (
    x1,
    x2,
    x3,
    x4,
    f,
    g,
    h
);
  input x1, x2, x3, x4;
  output f, g, h;

  assign g = (x1 & x3) | (x2 & x4);  // while these parenths are not needed, I think it's clearer
  assign h = (x1 | ~x3) & (~x2 | x4);
  assign f = g | h;
endmodule

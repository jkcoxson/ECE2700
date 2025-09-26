`timescale 1ns / 1ps

module testbench ();
reg Cin, x, y, s, Cout;
FullAdderHomework2 DUT(Cin, x, y, s, Cout);
initial begin
  Cin = 0;
  x = 0;
  y = 0;

  #5;

  Cin = 1;
  x = 0;
  y = 0;

  #5;

  Cin = 0;
  x = 1;
  y = 0;

  #5;

  Cin = 0;
  x = 0;
  y = 1;

  #5;

  Cin = 1;
  x = 1;
  y = 0;

  #5;

  Cin = 1;
  x = 0;
  y = 1;

  #5;

  Cin = 1;
  x = 1;
  y = 1;

  #5;

  Cin = 0;
  x = 1;
  y = 1;

  #5;
end
endmodule

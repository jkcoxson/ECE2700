`timescale 1ns / 1ps

module decoder4_16 (
    input [3:0] d,
    input en,
    output [15:0] o
);

  decoder3_8 high (
      .en(~d[3] & en),
      .d (d[2:0]),
      .o (o[15:8])
  );
  decoder3_8 low (
      .en(d[3] & en),
      .d (d[2:0]),
      .o (o[7:0])
  );
endmodule


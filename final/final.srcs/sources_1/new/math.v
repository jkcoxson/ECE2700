`timescale 1ns / 1ps

module math (
    input [7:0] x,
    y,
    input [2:0] state,
    output reg [15:0] s,
    output reg error
);

  localparam S_ADD = 3'b000;
  localparam S_SUB = 3'b001;
  localparam S_MUL = 3'b010;
  localparam S_DIV = 3'b011;
  localparam S_SHL = 3'b100;
  localparam S_SHR = 3'b101;
  localparam S_AND = 3'b110;
  localparam S_BOR = 3'b111;

  always @(*) begin
    error = 0;
    case (state)
      S_ADD:   s = x + y;
      S_SUB:   s = x - y;
      S_MUL:   s = x * y;
      S_DIV: begin
        if (y == 0) error = 1;
        s = x / y;
      end
      S_SHL:   s = x << 1;
      S_SHR:   s = x >> 1;
      S_AND:   s = x & y;
      S_BOR:   s = x | y;
      default: s = 0;
    endcase
  end
endmodule

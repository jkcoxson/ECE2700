`timescale 1ns / 1ps

module debouncer (
    input b,
    input clk,
    output reg d
);
  reg [1:0] state;

  always @(posedge clk) begin
    case (state)
      2'b00: begin
        if (b == 1) begin
          state <= 2'b01;
        end
        d <= 0;
      end
      2'b01: begin
        if (b == 1) begin
          state <= 2'b11;
        end else begin
          state <= 2'b00;
        end
        d <= 0;
      end
      2'b11: begin
        if (b == 1) begin
          state <= 2'b11;
        end else begin
          state <= 2'b10;
        end
        d <= 0;
      end
      2'b10: begin
        if (b == 1) begin
          state <= 2'b11;
          d <= 0;
        end else begin
          state <= 2'b00;
          d <= 1;
        end
      end
      default begin
        state <= 2'b00;
        d <= 0;
      end
    endcase
  end
endmodule

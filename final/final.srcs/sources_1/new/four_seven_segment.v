module four_seven_segment #(
    parameter PRESCALER = 50_000
) (
    input             clk,
    input      [15:0] value,
    input      [ 2:0] state,
    input             error,
    output reg [ 3:0] an,
    output     [ 6:0] seg
);

  reg [ 1:0] digit_sel = 0;
  reg [ 3:0] selected_digit;

  // Digit-scan clock divider
  reg [31:0] counter = 0;
  always @(posedge clk) begin
    counter <= counter + 1;
    if (counter == PRESCALER) begin
      counter   <= 0;
      digit_sel <= digit_sel + 1;
    end
  end

  // Page toggle every ~3 seconds
  reg page = 0;
  reg [31:0] page_counter = 0;
  always @(posedge clk) begin
    page_counter <= page_counter + 1;
    if (page_counter == 150_000_000) begin  // 3 sec @ 50MHz
      page_counter <= 0;
      page <= ~page;
    end
  end

  // Decide which 16-bit block to show
  wire [15:0] display_value = (page == 0) ? value : {error, 12'b0, state};

  // Digit selection
  always @(*) begin
    case (digit_sel)
      2'b00: begin
        an = 4'b1110;
        selected_digit = display_value[3:0];
      end
      2'b01: begin
        an = 4'b1101;
        selected_digit = display_value[7:4];
      end
      2'b10: begin
        an = 4'b1011;
        selected_digit = display_value[11:8];
      end
      2'b11: begin
        an = 4'b0111;
        selected_digit = display_value[15:12];
      end
    endcase
  end

  seven_segment seg_driver (
      .wxyz(selected_digit),
      .seg (seg)
  );

endmodule

`timescale 1ns / 1ps

module math_tb;

    reg  [7:0] x;
    reg  [7:0] y;
    reg  [2:0] state;
    wire [15:0] s;
    wire        error;

    // Instantiate DUT
    math dut (
        .x(x),
        .y(y),
        .state(state),
        .s(s),
        .error(error)
    );

    // Nice helper task
    task run_test(
        input [7:0] tx,
        input [7:0] ty,
        input [2:0] tstate
    );
    begin
        x = tx;
        y = ty;
        state = tstate;

        #20;
    end
    endtask

    initial begin

        // Initial inputs
        x = 0; y = 0; state = 0;

        #50;

        // --- ADD ---
        run_test(8'd10, 8'd5, 3'b000);

        // --- SUB ---
        run_test(8'd10, 8'd20, 3'b001);

        // --- MUL ---
        run_test(8'd15, 8'd15, 3'b010);

        // --- DIV (normal) ---
        run_test(8'd40, 8'd8, 3'b011);

        // --- DIV (divide by zero) ---
        run_test(8'd50, 8'd0, 3'b011);

        // --- SHL ---
        run_test(8'd4, 8'd0, 3'b100);

        // --- SHR ---
        run_test(8'd64, 8'd0, 3'b101);

        // --- AND ---
        run_test(8'hAA, 8'h0F, 3'b110);

        // --- OR ---
        run_test(8'h55, 8'hF0, 3'b111);

        #100;

        $finish;
    end

endmodule

`timescale 1ns / 1ps

module state_tb;

    // Testbench signals
    reg clk;
    reg btn;
    wire [2:0] operation;

    // Instantiate DUT
    state dut (
        .btn(btn),
        .clk(clk),
        .operation(operation)
    );

    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    task press_button_bouncy;
        begin
            btn = 1; #5;
            btn = 0; #5;
            btn = 1; #5;
            btn = 0; #5;
            btn = 1; #200; // hold long enough for debounce
        end
    endtask

    // Release button
    task release_button;
        begin
            btn = 0;
            #200;
        end
    endtask

    integer i;

    initial begin
        btn = 0;
        #100;

        // Perform 5 simulated button presses
        for (i = 0; i < 5; i = i + 1) begin
            press_button_bouncy();
            release_button();
        end

        #2000;
        $finish;
    end

endmodule

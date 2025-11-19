`timescale 1ns / 1ps

module top_tb;

    // Testbench signals
    reg clk;
    reg btn0;
    reg [15:0] sw;

    wire [15:0] led;
    wire [6:0] seg;
    wire [3:0] an;

    // Instantiate DUT
    top dut (
        .btn0(btn0),
        .clk(clk),
        .sw(sw),
        .led(led),
        .seg(seg),
        .an(an)
    );

    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    task press;
        begin
            btn0 = 1;
            #200;
            btn0 = 0;
            #200;
        end
    endtask

    initial begin
        // Initial values
        btn0 = 0;
        sw   = 16'h0000;

        // Give system time to stabilize
        #100;

        // Set some inputs
        sw[7:0]   = 8'd10;   // x
        sw[15:8]  = 8'd3;    // y

        // Perform 4 button presses to cycle operations
        press();   // -> ADD
        press();   // -> SUB
        press();   // -> MUL
        press();   // -> DIV

        // Try divide-by-zero to trigger error
        sw[15:8] = 0;
        press();

        // Let 7-segment page toggler run
        #5_000;   // enough time for several page flips

        $finish;
    end

endmodule

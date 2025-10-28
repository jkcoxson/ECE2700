`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:47:57 PM
// Design Name: 
// Module Name: universal_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module universal_test();
    parameter N = 8;

    reg clk;
    reg dir;
    reg L;
    reg w0;
    reg wn;
    reg [N-1:0] R;
    wire [N-1:0] Q;

    UniversalShift #(.N(N)) shiftreg (
        .clk(clk),
        .dir(dir),
        .L(L),
        .w0(w0),
        .wn(wn),
        .R(R),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        dir = 0;
        L   = 0;
        w0  = 0;
        wn  = 0;
        R   = 8'b00000000;

        // Wait a few cycles
        #20;

        // 1️⃣ Parallel load 8'b10110011
        R = 8'b10110011;
        L = 1;             // enable load
        #10;                // one clock edge
        L = 0;              // disable load
        #20;

        // 2️⃣ Shift left 4 times, feed in wn = 1
        dir = 0;            // shift left
        wn  = 1;
        repeat(4) @(posedge clk);
        #10;

        // 3️⃣ Shift right 3 times, feed in w0 = 0
        dir = 1;            // shift right
        w0  = 0;
        repeat(3) @(posedge clk);
        #10;

        // 4️⃣ Parallel load another pattern
        R = 8'b01010101;
        L = 1;
        @(posedge clk);
        L = 0;

        // 5️⃣ Shift right twice with w0 = 1
        dir = 1;
        w0  = 1;
        repeat(2) @(posedge clk);

        // 6️⃣ Done
        #20;
        $stop;  // stop simulation for waveform viewing
    end

endmodule

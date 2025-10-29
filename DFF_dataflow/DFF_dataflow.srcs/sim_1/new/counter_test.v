`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 02:15:44 PM
// Design Name: 
// Module Name: counter_test
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


module counter_test();
reg mclk = 0;
    reg incr = 0;
    reg rst = 0;
    wire [7:0] Q;

    counter #( .PRESCALER(1) ) dut (
        .mclk(mclk),
        .incr(incr),
        .rst(rst),
        .Q(Q)
    );

    always #5 mclk = ~mclk;

    initial begin
        rst = 1; incr = 0;
        #50;
        rst = 0;

        incr = 1;

        #500;

        rst = 1;
        #50;
        rst = 0;

        #2000;

        $finish;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 02:01:12 PM
// Design Name: 
// Module Name: rotateLED_test
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


module rotateLED_test();

reg mclk = 0;
    reg shift = 0;
    reg rst = 0;
    reg [7:0] D0 = 8'b00010001;
    wire [7:0] Q;

    rotateLED #( .PRESCALER(1) ) dut (
        .mclk(mclk),
        .shift(shift),
        .rst(rst),
        .D0(D0),
        .Q(Q)
    );

    always #5 mclk = ~mclk;

    initial begin
        rst = 1; shift = 0;
        #50;
        rst = 0;

        #100;

        shift = 1;
        
        #500
        
        rst = 1;
        #50;
        rst = 0;

        #2000;

        $finish;
    end


endmodule

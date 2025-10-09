`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 04:59:38 PM
// Design Name: 
// Module Name: MUXArray
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


module MUXArray #(parameter SIZE=4) (
    input sel,
    input [SIZE-1:0] a,
    input [SIZE-1:0] b,
    output [SIZE-1:0] o
    );
    genvar i;
    
    generate
        for (i=0; i<SIZE; i=i+1) begin: MUXarray
            mux m(
                .i({a[i],b[i]}),
                .sel(sel),
                .o(o[i])
            );
        end
    endgenerate
endmodule

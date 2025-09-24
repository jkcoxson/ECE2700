`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 04:35:37 PM
// Design Name: 
// Module Name: SevenSegmentTruthTable
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


module SevenSegmentTruthTable (
    input x3,
    input x2,
    input x1,
    input x0,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
);
    wire [3:0] N = {x3, x2, x1, x0};
    reg [6:0] D;
    assign a = D[6];
    assign b = D[5];
    assign c = D[4];
    assign d = D[3];
    assign e = D[2];
    assign f = D[1];
    assign g = D[0];

    always @(*) begin
//      if (N==4'b0000) begin
//        D = 7'b1111110;
//      end
//      else if (N==4'b0001) begin
//        D = 7'b0110000;
//      end
//      else if (N==4'b0010) begin
//        D = 7'b1101101;
//      end
//      else if (N==4'b0011)  begin
//        D = 7'b1111001;
//      end
//      else if (N==4'b0100) begin
//        D = 7'b0110011;
//      end
//      else if (N==4'b0101) begin
//        D = 7'b1011011;
//      end
//      else if (N==4'b0110) begin
//        D = 7'b1011111;
//      end
//      else if (N==4'b0111) begin
//        D = 7'b1110000;
//      end
//      else if (N==4'b1000) begin
//        D = 7'b1111111;
//      end
//      else if (N==4'b1001) begin
//        D = 7'b1111011;
//      end

//      // default case
//      else begin
//        D = 7'b0000000;
//      end
        case ( N )
            4'b0000: D = 7'b1111110;
            4'b0001: D = 7'b0110000;
            4'b0010: D = 7'b1101101;
            4'b0011: D = 7'b1111001;
            4'b0100: D = 7'b0110011;
            4'b0101: D = 7'b1011011;
            4'b0110: D = 7'b1011111;
            4'b0111: D = 7'b1110000;
            4'b1000: D = 7'b1111111;
            4'b1001: D = 7'b1111011;
            // hex
            4'b1010: D = 7'b1110111;
            4'b1011: D = 7'b0011111;
            4'b1100: D = 7'b1001110;
            4'b1101: D = 7'b0111101;
            4'b1110: D = 7'b1001111;
            4'b1111: D = 7'b1000111;
            
            default: D = 7'b0000000;
        endcase
    end
endmodule

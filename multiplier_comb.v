`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 02:35:53 PM
// Design Name: 
// Module Name: multiplier_comb
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

module multiplier_comb(a,b,p);
    input [3:0] a,b;
    wire [7:0] m0, m1, m2, m3;

    wire [7:0] s1,s2,s3;
    wire [7:0] p;

    output [7:0] p;

    assign m0 = b[0] ? {4'b0, a} : 8'b0;
    assign m1 = b[1] ? {3'b0, a, 1'b0} : 8'b0;
    assign m2 = b[2] ? {2'b0, a, 2'b0} : 8'b0;
    assign m3 = b[3] ? {1'b0, a, 3'b0} : 8'b0;

    assign s1 = m0 + m1;
    assign s2 = s1 + m2;
    assign s3 = s2 + m3;
    assign p = s3;

endmodule



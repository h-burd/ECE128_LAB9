`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 02:07:16 PM
// Design Name: 
// Module Name: multiplier_seq
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
module multiplier_seq(clk, rst, a, b, p);
    input clk;
    input rst;
    input [3:0] a;
    input [3:0] b;
    output reg [7:0] p;

    parameter S0_idle = 0, S1_multiply = 1, S2_update_result = 2, S3_done = 3;
    reg [1:0] CS, NS;

    reg [7:0] partial_product=8'b0; 
    reg [3:0] multiplicand=4'b0;  
    reg [3:0] operand_bb;     
    reg [2:0] shift_count;   
    
    

    always @(posedge clk or posedge rst) begin
        if (rst)
            CS <= S0_idle; 
        else
            CS <= NS;     
    end


    always @(posedge clk) begin
        //NS = CS;
        partial_product <= partial_product;
        shift_count <= shift_count;
        multiplicand <= multiplicand;
        operand_bb <= operand_bb;

        case (CS)
            S0_idle: begin
                partial_product <= 0;
                shift_count <= 0;
                multiplicand <= a; 
                operand_bb <= b;   
                NS = S1_multiply;
            end

            S1_multiply: begin
                if (shift_count < 4) begin
                    if (operand_bb[0] == 1) begin
                        partial_product <= partial_product + multiplicand;
                    end
                    multiplicand <= multiplicand << 1;
                    operand_bb <= operand_bb >> 1;     
                    shift_count <= shift_count + 1;
                    
                    
                    NS = S2_update_result;
                end else begin
                    NS = S3_done; 
                end
            end

            S2_update_result: begin
                NS = S1_multiply; 
            end

            S3_done: begin
                p <= partial_product; 
                NS = S0_idle;        
            end
        endcase
    end

endmodule

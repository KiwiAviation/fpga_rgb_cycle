// RGB Cycle

module top #(
    parameter CLK_FREQ = 12000000,
    parameter TICKS_PER_CYCLE = CLK_FREQ / 6
)(
    input logic     clk, 
    output logic    RGB_R,
    output logic    RGB_G,
    output logic    RGB_B
);
    
    logic [$clog2(CLK_FREQ) - 1:0] count = 1'b0;

    initial begin
        RGB_R = 1'b0;
        RGB_G = 1'b1;
        RGB_B = 1'b1;
    end

    always_ff @(posedge clk) begin
        if (count >= CLK_FREQ - 1) begin
            count <= 1'b0;
        end else begin
            count <= count + 1'b1;
        end

        if (count <= (1 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b0;
            RGB_G <= 1'b1;
            RGB_B <= 1'b1;
        end
        else if (count <= (2 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b0;
            RGB_G <= 1'b0;
            RGB_B <= 1'b1;
        end
        else if (count <= (3 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b1;
            RGB_G <= 1'b0;
            RGB_B <= 1'b1;
        end
        else if (count <= (4 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b1;
            RGB_G <= 1'b0;
            RGB_B <= 1'b0;
        end
        else if (count <= (5 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b1;
            RGB_G <= 1'b1;
            RGB_B <= 1'b0;
        end
        else if (count <= (6 * TICKS_PER_CYCLE)) begin
            RGB_R <= 1'b0;
            RGB_G <= 1'b1;
            RGB_B <= 1'b0;
        end
    end

endmodule

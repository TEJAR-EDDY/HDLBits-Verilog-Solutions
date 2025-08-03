module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
 reg [31:0] prev_in;

    always @(posedge clk) begin
        if (reset)
            out <= 32'b0;  // Synchronous reset
        else
            out <= out | (prev_in & ~in);  // Set bits where 1?0 transition occurred

        prev_in <= in;  // Store current input for next comparison
    end

endmodule

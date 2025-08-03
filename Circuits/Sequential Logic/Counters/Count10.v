module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
always @(posedge clk) begin
    if (reset || q==9)
            q <= 4'd0;         // Reset the counter to 0
        else
            q <= q + 1;        // Increment counter
    end
endmodule

module top_module (
    input clk,
    input reset,
    output [3:0] q);
 always @(posedge clk) begin
        if (reset)
            q <= 4'd1;                  // Reset to 1
        else if (q == 4'd10)
            q <= 4'd1;                  // Wrap around after reaching 10
        else
            q <= q + 4'd1;              // Otherwise, increment
    end
endmodule

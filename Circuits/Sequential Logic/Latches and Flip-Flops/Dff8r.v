module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
   always @(posedge clk) begin
        if (reset)
            q <= 8'b0;       // Clear all flip-flops on reset
        else
            q <= d;          // Store data on rising edge
    end
endmodule

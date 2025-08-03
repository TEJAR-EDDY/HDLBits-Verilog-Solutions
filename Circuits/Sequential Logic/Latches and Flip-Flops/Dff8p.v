module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always @(negedge clk) begin
        if (reset)
            q <=8'h34 ;       // Clear all flip-flops on reset
        else
            q <= d;          // Store data on rising edge
    end

endmodule

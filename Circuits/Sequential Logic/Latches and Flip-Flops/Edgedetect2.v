module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
      reg [7:0] prev_in;

    always @(posedge clk) begin
        // XOR detects any change: 0?1 or 1?0
        anyedge <= in ^ prev_in;

        // Save current input for comparison in next cycle
        prev_in <= in;
    end

endmodule

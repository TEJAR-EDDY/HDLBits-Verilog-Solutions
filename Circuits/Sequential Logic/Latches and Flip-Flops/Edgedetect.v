module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
  reg [7:0] prev_in;

    always @(posedge clk) begin
        // Detect rising edge for each bit
        pedge <= ~prev_in & in;

        // Update previous input for next comparison
        prev_in <= in;
    end
endmodule

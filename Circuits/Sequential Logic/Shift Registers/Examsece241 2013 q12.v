module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z
);

    reg [7:0] Q;  // Shift register

    // Shift operation
    always @(posedge clk) begin
        if (enable) begin
            Q <= {Q[6:0], S};  // Shift left, S into Q[0]
        end
    end

    // 3-to-8 multiplexer to read Q[addr]
    wire [2:0] addr = {A, B, C};  // Form the address from ABC

    assign Z = Q[addr];

endmodule

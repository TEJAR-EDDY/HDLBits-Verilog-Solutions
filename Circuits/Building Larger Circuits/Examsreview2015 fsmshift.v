module top_module (
    input clk,
    input reset,         // Synchronous reset
    output reg shift_ena
);

    reg [2:0] count;

    always @(posedge clk) begin
        if (reset)
            count <= 3'd0;
        else if (count < 3'd4)
            count <= count + 1;
    end

    always @(*) begin
        shift_ena = (count < 3'd4);
    end

endmodule

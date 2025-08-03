module top_module (
    input clk,
    input reset,         // Synchronous reset
    input data,
    output reg start_shifting
);

    typedef enum logic [2:0] {
        S0, S1, S2, S3, S4
    } state_t;

    state_t state, next;

    // State register
    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0: next = data ? S1 : S0;
            S1: next = data ? S2 : S0;
            S2: next = data ? S2 : S3;
            S3: next = data ? S4 : S0;
            S4: next = S4;  // Stuck state (detected)
            default: next = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        start_shifting = (state == S4);
    end

endmodule

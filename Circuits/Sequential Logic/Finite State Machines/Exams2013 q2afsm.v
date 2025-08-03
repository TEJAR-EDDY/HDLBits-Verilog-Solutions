module top_module (
    input clk,
    input resetn,         // active-low synchronous reset
    input [3:1] r,        // request signals: r[1], r[2], r[3]
    output reg [3:1] g    // grant signals: g[1], g[2], g[3]
);

    // State encoding
    typedef enum logic [1:0] {
        A = 2'd0,   // Idle
        B = 2'd1,   // g1
        C = 2'd2,   // g2
        D = 2'd3    // g3
    } state_t;

    state_t state, next_state;

    // State transition logic (Next state logic)
    always @(*) begin
        case (state)
            A: begin
                if (r[1]) next_state = B;
                else if (r[2]) next_state = C;
                else if (r[3]) next_state = D;
                else next_state = A;
            end

            B: next_state = (r[1]) ? B : A;
            C: next_state = (r[2]) ? C : A;
            D: next_state = (r[3]) ? D : A;

            default: next_state = A;
        endcase
    end

    // State register (flip-flops)
    always @(posedge clk) begin
        if (!resetn)
            state <= A;
        else
            state <= next_state;
    end

    // Output logic
    always @(*) begin
        // Default outputs
        g = 3'b000;

        case (state)
            B: g[1] = 1'b1;
            C: g[2] = 1'b1;
            D: g[3] = 1'b1;
            default: g = 3'b000;
        endcase
    end

endmodule

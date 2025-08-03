module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
  		parameter LEFT    = 2'd0,
        RIGHT   = 2'd1,
        FALL_L  = 2'd2,
        FALL_R  = 2'd3;
    reg [1:0]  state, next;
    // State transition logic
    always @(*) begin
        case (state)
            LEFT: begin
                if (!ground) next = FALL_L;
                else if (bump_left) next = RIGHT;
                else next = LEFT;
            end
            RIGHT: begin
                if (!ground) next = FALL_R;
                else if (bump_right) next = LEFT;
                else next = RIGHT;
            end
            FALL_L: begin
                if (ground) next = LEFT;
                else next = FALL_L;
            end
            FALL_R: begin
                if (ground) next = RIGHT;
                else next = FALL_R;
            end
            default: next = LEFT;
        endcase
    end
    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;  // Reset state
        else
            state <= next;
    end
    // Output logic
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah       = (state == FALL_L) || (state == FALL_R);
endmodule

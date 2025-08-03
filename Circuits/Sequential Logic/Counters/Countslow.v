module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
     always @(posedge clk) begin
        if (reset)
            q <= 4'd0;                  // Reset to 1
         else if (slowena)
             if(q==4'd9)
            q <= 4'd0;                  // Wrap around after reaching 10
        else
            q <= q + 4'd1;              // Otherwise, increment
    end

endmodule

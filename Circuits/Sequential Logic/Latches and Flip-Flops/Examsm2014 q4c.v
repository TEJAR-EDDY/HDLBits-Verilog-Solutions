module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
 always @(posedge clk) begin
        if (r)
            q <= 1'b0;     // Asynchronous reset to 0
        else
            q <= d;        // Normal D flip-flop behavior
    end
endmodule

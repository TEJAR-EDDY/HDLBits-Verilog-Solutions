module top_module (
    input d, 
    input ena,
    output q);
    always @(*) begin
        if (ena)
            q <= d;   // Latch is open: pass d to q
        // else: do nothing ? latch holds previous q
    end
endmodule

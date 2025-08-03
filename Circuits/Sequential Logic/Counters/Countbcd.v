module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
  // ena logic: each digit is enabled when lower digit(s) == 9
    assign ena[1] = (q[3:0] == 4'd9);                             // ones rolled over
    assign ena[2] = ena[1] && (q[7:4] == 4'd9);                   // tens rolled over
    assign ena[3] = ena[2] && (q[11:8] == 4'd9);                  // hundreds rolled over

    always @(posedge clk) begin
        if (reset) begin
            q <= 16'd0;
        end else begin
            // ones digit
            if (q[3:0] == 4'd9)
                q[3:0] <= 4'd0;
            else
                q[3:0] <= q[3:0] + 1;

            // tens digit
            if (ena[1]) begin
                if (q[7:4] == 4'd9)
                    q[7:4] <= 4'd0;
                else
                    q[7:4] <= q[7:4] + 1;
            end

            // hundreds digit
            if (ena[2]) begin
                if (q[11:8] == 4'd9)
                    q[11:8] <= 4'd0;
                else
                    q[11:8] <= q[11:8] + 1;
            end

            // thousands digit
            if (ena[3]) begin
                if (q[15:12] == 4'd9)
                    q[15:12] <= 4'd0;
                else
                    q[15:12] <= q[15:12] + 1;
            end
        end
    end

//endmodule
endmodule

module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    integer i;
    always @(*) begin
        out = 8'd0;  // Initialize count to 0
        for (i = 0; i < 255; i = i + 1) begin
            out = out + in[i];  // Add 1 for each bit that is high
        end
    end
endmodule

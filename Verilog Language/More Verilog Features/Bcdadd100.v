module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
wire [100:0] carry;      // 101 wires for 100 carry connections (carry[0] = cin, carry[100] = cout)
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin: bcd_adders
            bcd_fadd bfa (
                .a(a[i*4 +: 4]),           // Extract 4 bits for BCD digit a
                .b(b[i*4 +: 4]),           // Extract 4 bits for BCD digit b
                .cin(carry[i]),
                .sum(sum[i*4 +: 4]),       // Store 4-bit sum
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[100];  // Final carry-out from the last BCD digit

endmodule

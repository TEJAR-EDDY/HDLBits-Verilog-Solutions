module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

      wire [3:0] bcd0, bcd1, bcd2;

    // Enable logic for each counter
    assign c_enable[0] = 1;                                // Always enabled
    assign c_enable[1] = (bcd0 == 4'd9);                   // Enabled when lower digit is 9
    assign c_enable[2] = (bcd0 == 4'd9) && (bcd1 == 4'd9); // Enabled when both lower digits are 9

    // OneHertz: Asserted for 1 cycle when counter reaches 999
    assign OneHertz = (bcd0 == 4'd9) && (bcd1 == 4'd9) && (bcd2 == 4'd9);

    // Instantiate 3 BCD counters
    bcdcount bcd0_counter (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(bcd0)
    );

    bcdcount bcd1_counter (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(bcd1)
    );

    bcdcount bcd2_counter (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(bcd2)
    );


endmodule
